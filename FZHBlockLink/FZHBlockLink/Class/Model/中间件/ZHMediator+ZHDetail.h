//
//  ZHMediator+ZHDetail.h
//  FZHBlockLink
//
//  Created by Mac on 2019/8/16.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHMediator (ZHDetail)
+ (void)detailShowWithId:(NSString *)Id name:(NSString *)name;

+ (void)detailPushVC:(NSString *)vc param:(NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END
