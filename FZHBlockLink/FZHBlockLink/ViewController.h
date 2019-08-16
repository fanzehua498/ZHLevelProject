//
//  ViewController.h
//  FZHBlockLink
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (NSInteger)plus:(NSInteger)num1 numb:(NSInteger )numb2;

//性能测试
- (void)loadManyDatas;

//异步测试
- (void)requestdata:(void(^)(id data))dataBlock;

@end

