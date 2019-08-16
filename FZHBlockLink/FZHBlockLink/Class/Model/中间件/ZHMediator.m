//
//  ZHMediator.m
//  FZHBlockLink
//
//  Created by Mac on 2019/8/16.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHMediator.h"

@implementation ZHMediator

+(id)Mediator_performTargetName:(NSString *)targetName actionName:(NSString *)actionName params:(NSDictionary *)params
{
    Class targetClass = targetName.length > 0 ? NSClassFromString(targetName) : nil;
    NSString *msg = [NSString stringWithFormat:@"不存在Target类名为:%@",targetName];
    NSAssert(targetClass, msg);
    
    SEL action = actionName.length > 0 ? NSSelectorFromString(actionName) : nil;
    msg = [NSString stringWithFormat:@"Target_%@ 不存在 action为:%@",targetName,actionName];
    NSAssert(action, msg);
    
    if ([targetClass respondsToSelector:action]) {
        return [self SafePerformAction:action target:targetClass params:params];
    }else{
        msg = [NSString stringWithFormat:@"Target_%@ 不能响应action_%@",targetName,actionName];
        NSAssert(0, msg);
    }
    
    return nil;
}

+ (id)SafePerformAction:(SEL)action target:(id)target params:(NSDictionary *)params
{
    NSMethodSignature *methodsignature = [target methodSignatureForSelector:action];
    if (methodsignature == nil) {
        return nil;
    }
    const char *retType = [methodsignature methodReturnType];
    if (strcmp(retType, @encode(void)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodsignature];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        
        return nil;
    }
    if (strcmp(retType, @encode(NSInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodsignature];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    if (strcmp(retType, @encode(BOOL)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodsignature];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    if (strcmp(retType, @encode(CGFloat)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodsignature];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    if (strcmp(retType, @encode(NSUInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodsignature];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
#pragma clang diagnotic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return  [target performSelector:action withObject:params];
#pragma clang diagnostic pop
}

@end
