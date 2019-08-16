//
//  ZHBlock.m
//  FZHBlockLink
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHBlock.h"

@interface ZHBlock ()

@end


@implementation ZHBlock

-(instancetype)initWithData:(NSString *)data
{
    self = [super init];
    if (self) {
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *strDate = [dateFormatter stringFromDate:date];
        self.dateCreated = strDate;
        self.nonce = 0;
        self.data = data;
    }
    return self;
}


-(NSString *)key
{
    return [NSString stringWithFormat:@"%ld%@%@",self.index,self.dateCreated,self.previousHash];
}


@end
