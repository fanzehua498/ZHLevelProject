//
//  ZHBlockChain.m
//  FZHBlockLink
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHBlockChain.h"

@interface ZHBlockChain ()

@property (nonatomic, strong) NSMutableArray *blocks;

@end

@implementation ZHBlockChain

-(instancetype)initGen:(ZHBlock *)genesisBlock
{
    if (self = [super init]) {
        [self addGBlock:genesisBlock];
    }
    return self;
}

- (void)addGBlock:(ZHBlock *)block
{
    if (self.blocks.count == 0) {
        // 添加创世区块
        // 第一个区块没有 previous hash
        block.previousHash = @"0";
        block.hashValue = [self generateHash:block];
    }else{
        ZHBlock *previousBlock = [self getPreviousBlock];
        block.previousHash = previousBlock.hashValue;
        block.index = self.blocks.count;
        block.hashValue = [self generateHash:block];
    }
    [self.blocks addObject:block];
    [self displayBlock:block];
}

#pragma mark - private
- (ZHBlock *)getPreviousBlock
{
    return self.blocks[self.blocks.count - 1];
}

- (void)displayBlock:(ZHBlock *)block
{
    NSLog(@"------ index第 (%ld) 个区块 --------",block.index);
    NSLog(@"创建日期dateCreated：(%@)",block.dateCreated);
    NSLog(@"数据data：%@",block.data);
    NSLog(@"Noce:%ld",block.nonce);
    NSLog(@"前一个区块链的哈希值previousHash：%@",block.previousHash);
    NSLog(@"哈希值hashValue：%@",block.hashValue);
}

- (NSString *)generateHash:(ZHBlock *)block
{
    NSString *hash = block.key;
    while ([hash hasPrefix:@"00"]) {
        block.nonce += 1;
        hash = block.key;
    }
    return hash;
}

@end
