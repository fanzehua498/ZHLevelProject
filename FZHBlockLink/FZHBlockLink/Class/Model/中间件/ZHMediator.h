//
//  ZHMediator.h
//  FZHBlockLink
//
//  Created by Mac on 2019/8/16.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ZHMediatorCallBack)(id param);
extern NSString *const ZHMediatorCallBackKey;//可以放在param中
NS_ASSUME_NONNULL_BEGIN

@interface ZHMediator : NSObject

/*!
 * @method Mediator_performTargetName
 * @abstract 本地组件调用l入口
 * @discussion discussion
 * @param  targetName 目标组件（处理类）
 * @param actionName 调用方法
 * @param params 参数
 * @result id
 */
+ (id)Mediator_performTargetName:(NSString *)targetName
                      actionName:(NSString *)actionName
                          params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
