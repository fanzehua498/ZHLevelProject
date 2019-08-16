//
//  ZHBlock.h
//  FZHBlockLink
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZHBlock : NSObject
//区块创建的日期
@property (nonatomic, copy) NSString *dateCreated;
//前一个区块的哈希值
@property (nonatomic, copy) NSString *previousHash;
//当前区块的哈希值
@property (nonatomic, copy) NSString *hashValue;
//递增的数字，对生成哈希值很关键
@property (nonatomic,assign) NSInteger nonce;
/*区块位于区块链中的位置。index为0则表示该区块是区块
 链中的第一个区块.index为1则表示区块链中的第二个区块*/
@property (nonatomic,assign) NSInteger index;
//任意有价值的信息。可以是金钱、医疗信息和房地产信息等等
@property (nonatomic, copy) NSString *data;
//计算属性，提供给产生哈希值的函数
@property (nonatomic, copy) NSString *key;


-(instancetype)initWithData:(NSString *)data;
@end


