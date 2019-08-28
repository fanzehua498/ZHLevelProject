//
//  ZHMetalOpenGLESViewController.m
//  FZHBlockLink
//
//  Created by Mac on 2019/8/13.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHMetalOpenGLESViewController.h"
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import "LYShaderTypes.h"


@interface ZHMetalOpenGLESViewController ()<MTKViewDelegate>

@property (nonatomic, strong) MTKView *mtkView;

@property (nonatomic, strong) id<MTLRenderPipelineState> pipelineState;

@property (nonatomic, strong) id<MTLCommandQueue> commandQueue;

@property (nonatomic, strong) id <MTLTexture> texture;

@property (nonatomic, strong) id<MTLBuffer> vertices;

@property (nonatomic,assign) CGFloat numVertices;

@property (nonatomic,assign) simd_uint2 viewportSize;

@end

@implementation ZHMetalOpenGLESViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initMtkView];
    
    [self setupPipeline];
    
    [self setupVertex];
    [self setUpTexture];
    
}

//1.新建MTKView
- (void)initMtkView{
    
    self.mtkView = [[MTKView alloc] initWithFrame:self.view.bounds];
    self.mtkView.device = MTLCreateSystemDefaultDevice();
    
    self.view = self.mtkView;
    self.mtkView.delegate = self;
    self.viewportSize = (vector_uint2){self.mtkView.drawableSize.width, self.mtkView.drawableSize.height};
}

//2.设置渲染管道
- (void)setupPipeline{
    
    id<MTLLibrary> defautLib = self.mtkView.device.newDefaultLibrary;
    id<MTLFunction> vertexFunction = [defautLib newFunctionWithName:@"vertexShader"];//顶点shader，vertexShader是函数名
    id<MTLFunction> fragmentFunction = [defautLib newFunctionWithName:@"samplingShader"];//片元shader samplingShader是函数名
    
    MTLRenderPipelineDescriptor *piple = [[MTLRenderPipelineDescriptor alloc] init];
    piple.vertexFunction = vertexFunction;
    piple.fragmentFunction = fragmentFunction;
    piple.colorAttachments[0].pixelFormat = self.mtkView.colorPixelFormat;
    
    //创建图形渲染管道，耗性能操作不宜频繁调用
    self.pipelineState = [self.mtkView.device newRenderPipelineStateWithDescriptor:piple error:NULL];
    //commandQueue是渲染指令队列，保证渲染指令有序地提交到GPU
    self.commandQueue = [self.mtkView.device newCommandQueue];
}


//3.设置顶点数据
- (void)setupVertex{
    
    static const LYVertex quadVertices[] = {
        //顶点坐标，分别是x,y,z,w; 纹理坐标，x，y；
        {{0.5,-0.5,0.0,1.0},{1.f,1.f}},
        {{-0.5,-0.5,0.0,1.0},{0.f,1.f}},
        {{-0.5,0.5,0.0,1.0},{0.f,0.f}},
        
        {{0.5,-0.5,0.0,1.0},{1.f,1.f}},
        {{-0.5,0.5,0.0,1.0},{0.f,0.f}},
        {{0.5,0.5,0.0,1.0},{1.f,0.f}},
    };
    //创建顶点缓存
    self.vertices = [self.mtkView.device newBufferWithBytes:quadVertices length:sizeof(quadVertices) options:MTLResourceStorageModeShared];
    //顶点个数
    self.numVertices = sizeof(quadVertices)/sizeof(LYVertex);
}

//4.设置纹理数据
- (void)setUpTexture
{
    UIImage *image = [UIImage imageNamed:@"abc"];
    
    //纹理描述
    //MTLTextureDescriptor是纹理数据的描述符，可以设置像素颜色格式、图像宽高等，用于创建纹理；
    MTLTextureDescriptor *textureDes = [[MTLTextureDescriptor alloc] init];
    textureDes.pixelFormat = MTLPixelFormatA8Unorm;
    textureDes.width = image.size.width;
    textureDes.height = image.size.height;
    //创建纹理
    self.texture = [self.mtkView.device newTextureWithDescriptor:textureDes];
    
    //MTLRegion类似UIKit的frame，用于表明纹理数据的存放区域；
    MTLRegion regin = {{0,0,0},{image.size.width,image.size.height,1}};
    Byte *imageByte = [self loadImage:image];
    
    if (imageByte) {
        //纹理创建完毕后，需要用-replaceRegion: mipmapLevel:withBytes:bytesPerRow:接口上传纹理数据；
        [self.texture replaceRegion:regin mipmapLevel:0 withBytes:imageByte bytesPerRow:4 * image.size.width];
        free(imageByte);
        imageByte = NULL; 
    }
}


#pragma mark - MTKViewDelegate

-(void)mtkView:(MTKView *)view drawableSizeWillChange:(CGSize)size
{
    self.viewportSize = (vector_uint2){size.width,size.height};
}

//5.具体渲染过程
//MetalKit每帧的渲染回调，可以在内部做渲染的处理；
- (void)drawInMTKView:(MTKView *)view
{
    //每次渲染都要单独创建一个CommandBuffer
    //1.commandBuffer存放每次渲染的指令，commandQueue内部存在着多个commandBuffer
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
    MTLRenderPassDescriptor *renderPasssDescriptor = view.currentRenderPassDescriptor;
    //MTLRenderPassDescriptor描述一系列attachments的值 类似GL的FrameBuffer；同时也用来创建MTLRenderCommandEncoder
    if (renderPasssDescriptor != nil) {
        renderPasssDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(0.0, 0.5, 0.5, 1.0f);//默认颜色设置
        //编码绘制指令的enconder
        id<MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPasssDescriptor];
        //设置显示区域
        [renderEncoder setViewport:(MTLViewport){0.0,0.0,self.viewportSize.x,self.viewportSize.y,-1.0,1.0}];
        //设置渲染通道，以保证顶点和元两个shader会被调用
        [renderEncoder setRenderPipelineState:self.pipelineState];
        //设置顶点缓存
       [renderEncoder setVertexBuffer:self.vertices offset:0 atIndex:0];
        //设置纹理
        [renderEncoder setFragmentTexture:self.texture atIndex:0];
        //绘制
        [renderEncoder drawPrimitives:MTLPrimitiveTypeTriangle vertexStart:0 vertexCount:self.numVertices];
        //结束
        [renderEncoder endEncoding];
        
        //显示
        [commandBuffer presentDrawable:view.currentDrawable];
    }
    //提交
    [commandBuffer commit];
}



- (Byte *)loadImage:(UIImage *)image
{
    
    //1.获取图片h上下文
    CGImageRef ref = image.CGImage;
    
    //2.获取图片的大小
    size_t width = CGImageGetWidth(ref);
    size_t height = CGImageGetHeight(ref);
    
    Byte *byte = calloc(width * height * 4, sizeof(Byte));
    CGContextRef  sprContext = CGBitmapContextCreate(byte, width, height, 8, width * 4, CGImageGetColorSpace(ref), kCGImageAlphaPremultipliedLast);
    
    //3.在CGContextRef上绘图
    CGContextDrawImage(sprContext, CGRectMake(0, 0, width, height), ref);
    CGContextRelease(sprContext);
    
    return byte;
}

- (id)getMLdevice
{
    id<MTLDevice> device = MTLCreateSystemDefaultDevice();
    if (device == nil) {
        return nil;
    }
    return device;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
