//
//  ZHBlockChain.h
//  FZHBlockLink
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHBlock.h"


@interface ZHBlockChain : NSObject

-(instancetype)initGen:(ZHBlock *)genesisBlock;

@end

