//
//  ZHMediator+ZHDetail.m
//  FZHBlockLink
//
//  Created by Mac on 2019/8/16.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHMediator+ZHDetail.h"

@implementation ZHMediator (ZHDetail)

+(void)detailShowWithId:(NSString *)Id name:(NSString *)name
{
    NSDictionary *param = @{@"id":Id,@"name":name};
    ZHMediator Mediator_performTargetName:<#(nonnull NSString *)#> actionName:<#(nonnull NSString *)#> params:<#(nonnull NSDictionary *)#>
}

+(void)detailPushVC:(NSString *)vc param:(NSDictionary *)param
{
    ZHMediator Mediator_performTargetName:<#(nonnull NSString *)#> actionName:<#(nonnull NSString *)#> params:<#(nonnull NSDictionary *)#>
}

@end
