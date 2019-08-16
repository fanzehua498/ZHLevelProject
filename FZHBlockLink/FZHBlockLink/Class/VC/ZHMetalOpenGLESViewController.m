//
//  ZHMetalOpenGLESViewController.m
//  FZHBlockLink
//
//  Created by Mac on 2019/8/13.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHMetalOpenGLESViewController.h"
#import <Metal/Metal.h>

@interface ZHMetalOpenGLESViewController ()

@end

@implementation ZHMetalOpenGLESViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}



- (id)getMLdevice
{
    id<MTLDevice> device = MTLCreateSystemDefaultDevice();
    if (device == nil) {
        return nil;
    }
    return device;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
