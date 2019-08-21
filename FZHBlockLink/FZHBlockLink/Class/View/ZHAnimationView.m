//
//  ZHAnimationView.m
//  FZHBlockLink
//
//  Created by Mac on 2019/8/20.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHAnimationView.h"

@implementation ZHAnimationView

-(void)animationWithBounds
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 10, 10)];
    animation.duration = 1.5;
    [self.layer addAnimation:animation forKey:@"bounds"];
    
}
- (void)animationWithPosition
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(10, 10)];
    animation.duration = 1.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    [self.layer addAnimation:animation forKey:@"bounds"];
}
// 通过 bounds 和 position 计算得来，它不可动画
- (void)animationWithFrame
{}
- (void)animationWithAnchorPoint
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"AnchorPoint"];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
    animation.duration = 1.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [self.layer addAnimation:animation forKey:@"AnchorPoint"];
}
- (void)animationWithCornerRadius
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation.toValue = @100;
    animation.duration = 1.5;
//    animation.repeatCount = 1;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    
    [self.layer addAnimation:animation forKey:@"cornerRadius"];
}
- (void)animationWithTransform
{
    /**
     transform.scale
     比例转化
     @(0.8)
     transform.scale.x
     宽的比例
     @(0.8)
     transform.scale.y
     高的比例
     @(0.8)
     transform.rotation.x
     围绕x轴旋转
     @(M_PI)
     transform.rotation.y
     围绕y轴旋转
     @(M_PI)
     transform.rotation.z
     围绕z轴旋转
     @(M_PI)
     */
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    animation.toValue = @0.8;
    animation.duration = 1.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [self.layer addAnimation:animation forKey:@"transform"];
}
- (void)animationWithZposition
{
    //zPosition
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"zPosition"];
    animation.toValue = @(M_PI);
    animation.duration = 1.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [self.layer addAnimation:animation forKey:@"zPosition"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
