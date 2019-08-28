//
//  LYShaderTypes.h
//  FZHBlockLink
//
//  Created by Mac on 2019/8/27.
//  Copyright © 2019年 FZH. All rights reserved.
//

#ifndef LYShaderTypes_h
#define LYShaderTypes_h
#include <simd/simd.h>

#pragma mark - Metal 1
//typedef struct {
//
//    vector_float4 position;
//    vector_float2 textureCoordinate;
//
//}LYVertex;

#pragma mark - Metal 2
typedef struct
{
    vector_float4 position;
    vector_float3 color;
    vector_float2 textureCoordinate;
} LYVertex;


typedef struct
{
    matrix_float4x4 projectionMatrix;
    matrix_float4x4 modelViewMatrix;
} LYMatrix;



typedef enum LYVertexInputIndex
{
    LYVertexInputIndexVertices     = 0,
    LYVertexInputIndexMatrix       = 1,
} LYVertexInputIndex;



typedef enum LYFragmentInputIndex
{
    LYFragmentInputIndexTexture     = 0,
} LYFragmentInputIndex;



#endif /* LYShaderTypes_h */
