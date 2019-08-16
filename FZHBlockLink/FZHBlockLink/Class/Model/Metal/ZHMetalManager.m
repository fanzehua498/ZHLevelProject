//
//  ZHMetalManager.m
//  FZHBlockLink
//
//  Created by Mac on 2019/8/13.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHMetalManager.h"


typedef struct
{
    
    
} RasterizerData;


@interface ZHMetalManager ()
@property (nonatomic, strong) id<MTLDevice> device;

@end

@implementation ZHMetalManager

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        id<MTLDevice> device = MTLCreateSystemDefaultDevice();
        if (device == nil) {
            NSLog(@"该设备不支持");
        }
        self.device = device;
    }
    return self;
}

/**
  MTLDevice 代表 GPU 的接口
 提供
 查询设备状态
 创建 buffer 和 texture
 指令转换和队列化渲染进行指令的计算
 */
- (id)getMLdevice
{
    id<MTLDevice> device = MTLCreateSystemDefaultDevice();
    if (device == nil) {
        //设备不支持 Metal 的时候会返回空
        return nil;
    }
    return device;
}

- (void)queueCommon
{
    //渲染队列 MTLCommandQueue 单一，线程安全，确保能够顺序执行
    id<MTLCommandQueue> quque = self.device.newCommandQueue;
    //里面的是将要渲染的指令 MTLCommandBuffer，这是个线程安全的队列，可以支持多个 CommandBuffer 同时编码
     //quque.commandBuffer;
    
    id<MTLCommandBuffer> buffer = quque.commandBuffer;
    //监听结果
    [buffer addCompletedHandler:^(id<MTLCommandBuffer> _Nonnull buffer) {
        
    }];
    [buffer waitUntilCompleted];
    [buffer addScheduledHandler:^(id<MTLCommandBuffer> _Nonnull buffer) {
        
    }];
    [buffer waitUntilScheduled];
    
    //在 Metal 中资源分为两种：
    //MTLBuffer 代表着未格式化的内存，可以是任何类型的数据。 Buffer 用来做顶点着色和计算状态。
    //MTLTexture 代表着有着特殊纹理类型和像素格式的格式化的图像数据。用来做顶点，面和计算的源
    
}

- (void)lib{
//    id <MTLLibrary> lib =[mtllib]
}

//设置YUV->RGB转换的矩阵
- (void)setupMatrix
{
//    self.device
//    matrix
}

+(ZHMetalManager *)log:(NSDictionary *)param
{
    ZHMetalManager *ma = [ZHMetalManager new];
    
    NSLog(@"come on baby %@",param);
    return ma;
}

@end
