//
//  ZHAnimationView.h
//  FZHBlockLink
//
//  Created by Mac on 2019/8/20.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 
 */

NS_ASSUME_NONNULL_BEGIN

@interface ZHAnimationView : UIView

/**
 CALayer 动画
 */
- (void)animationWithBounds;
- (void)animationWithPosition;
// 通过 bounds 和 position 计算得来，它不可动画
- (void)animationWithFrame;
- (void)animationWithAnchorPoint;
- (void)animationWithCornerRadius;
- (void)animationWithTransform;
- (void)animationWithZposition;


@end

NS_ASSUME_NONNULL_END
