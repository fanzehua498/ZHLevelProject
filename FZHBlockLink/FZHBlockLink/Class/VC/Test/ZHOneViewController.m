//
//  ZHOneViewController.m
//  FZHBlockLink
//
//  Created by Mac on 2019/10/16.
//  Copyright © 2019 FZH. All rights reserved.
//

#import "ZHOneViewController.h"
#import "ZHTwoViewController.h"
@interface ZHOneViewController ()

@end

@implementation ZHOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ZHTwoViewController *vc = [ZHTwoViewController new];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
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
