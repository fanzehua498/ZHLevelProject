//
//  metalfile.metal
//  FZHBlockLink
//
//  Created by Mac on 2019/8/13.
//  Copyright © 2019年 FZH. All rights reserved.
//


/**
 
 
 
 */
#include <metal_stdlib>
using namespace metal;

//结构体（用于顶点函数的输出/片元函数输入）
//typedef struct {
//    
//    float4 clipSpacePosition [[position]];//position的修饰符表示这个是顶点
//    float2 textureCoordinate;//纹理坐标
//}RasterData;
//
////RasterData 返回数据类型->片元函数
////vertex_id 是顶点shader每次处理的index，o用于定位当前的顶点
////buffer 表明是缓存数据，0是索引
//vertex RasterData vertexShader(uint vertexID [[vertex_id]],constant CCVertex *vertexArray [[ buffer(CCvertexInputIndexVertices)]])
//{
//    RasterData out;
//    //顶点坐标
//    out.clipSpacePosition = vertexArray[vertexID].position;
//    //纹理坐标
//    out.textureCoordinate = vertexArray[vertexID].textureCoordinate;
//    
//    return out;
//}
//
//fragment float4 sampliShader(RasterData input [[stage_in]],
//                             texture2d<float> textureY [[texture(CCFragmentTextureIndexTexttureY)]],
//                             texture2d<float> textureUV [[texture(CCFragmentTextureIndexTexttureUV)]],
//                             constant CCConverMatrix *convertMatrix [[buffer(CCFragmentTextureIndexMatrix)]])
//{
//    //1.获取纹理采样器
//    constexpr sampler textureSample (mag_filter::liner,
//                                     min_filter::liner);
//    
//    /**
//     读取YUV 颜色值
//     textureY.sample(textureSampler,input.textureCoordinate).r
//     从textureY中的纹理采集器中读取，纹理坐标对应上的Rd值.(Y)
//     textureUV.sample(textureSampler,input.textureCoordinate).rg
//     从textureUV中的纹理采集器中读取，纹理坐标对应的RG值.(UV)
//     */
//    float3 yuv = float3(textureY.sample(textureSampler,input.textureCoordinate).r,
//                        textureUV.sample(textureSampler,input.textureCoordinate).rg);
//    
//    //3.将YUV转化为RGB.ConvertMatrix->matrix * (YUV + convertmatrix -> offset)
//    float3 rgb = convertMatrix ->matrix * (yuv + convertMatrix->offset);
//    
//    return float4(rgb,1.0);
//}
