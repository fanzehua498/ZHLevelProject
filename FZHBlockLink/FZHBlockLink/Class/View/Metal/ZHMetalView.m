//
//  ZHMetalView.m
//  FZHBlockLink
//
//  Created by Mac on 2019/8/23.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHMetalView.h"

@interface ZHMetalView ()
@property (nonatomic, strong) MTKView *mtkView;

@end

@implementation ZHMetalView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)initMtkView{
    
    self.mtkView = [[MTKView alloc] initWithFrame:self.bounds];
    self.mtkView.device = MTLCreateSystemDefaultDevice();//获取默认的device
    
//    self.mtkView.delegate = self;

 
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
