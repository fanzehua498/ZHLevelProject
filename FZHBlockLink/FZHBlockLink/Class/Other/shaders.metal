//
//  shaders.metal
//  FZHBlockLink
//
//  Created by Mac on 2019/8/27.
//  Copyright © 2019年 FZH. All rights reserved.
//

#include <metal_stdlib>
#import "LYShaderTypes.h"
using namespace metal;

#pragma mark - Metal 1
//typedef struct
//{
//    float4 clipSpacePosition [[position]]; // position的修饰符表示这个是顶点
//    
//    float2 textureCoordinate; // 纹理坐标，会做插值处理
//    
//} RasterizerData;
//
//vertex RasterizerData // 返回给片元着色器的结构体
//vertexShader(uint vertexID [[ vertex_id ]], // vertex_id是顶点shader每次处理的index，用于定位当前的顶点
//             constant LYVertex *vertexArray [[ buffer(0) ]]) { // buffer表明是缓存数据，0是索引
//    RasterizerData out;
//    out.clipSpacePosition = vertexArray[vertexID].position;
//    out.textureCoordinate = vertexArray[vertexID].textureCoordinate;
//    return out;
//}
//
//fragment float4
//samplingShader(RasterizerData input [[stage_in]], // stage_in表示这个数据来自光栅化。（光栅化是顶点处理之后的步骤，业务层无法修改）
//               texture2d<half> colorTexture [[ texture(0) ]]) // texture表明是纹理数据，0是索引
//{
//    constexpr sampler textureSampler (mag_filter::linear,
//                                      min_filter::linear); // sampler是采样器
//    
//    half4 colorSample = colorTexture.sample(textureSampler, input.textureCoordinate); // 得到纹理对应位置的颜色
//    
//    return float4(colorSample);
//}


#pragma mark - Metal 2
typedef struct
{
    float4 clipSpacePosition [[position]];
    float3 pixelColor;
    float2 textureCoordinate;
    
} RasterizerData;

vertex RasterizerData // 顶点
vertexShader(uint vertexID [[ vertex_id ]],
             constant LYVertex *vertexArray [[ buffer(LYVertexInputIndexVertices) ]],
             constant LYMatrix *matrix [[ buffer(LYVertexInputIndexMatrix) ]]) {
    RasterizerData out;
    out.clipSpacePosition = matrix->projectionMatrix * matrix->modelViewMatrix * vertexArray[vertexID].position;
    out.textureCoordinate = vertexArray[vertexID].textureCoordinate;
    out.pixelColor = vertexArray[vertexID].color;
    
    return out;
}

fragment float4 // 片元
samplingShader(RasterizerData input [[stage_in]],
               texture2d<half> textureColor [[ texture(LYFragmentInputIndexTexture) ]])
{
    constexpr sampler textureSampler (mag_filter::linear,
                                      min_filter::linear);
    
    //    half4 colorTex = textureColor.sample(textureSampler, input.textureCoordinate);
    half4 colorTex = half4(input.pixelColor.x, input.pixelColor.y, input.pixelColor.z, 1);
    return float4(colorTex);
}
