//
//  ZHTwoViewController.m
//  FZHBlockLink
//
//  Created by Mac on 2019/10/16.
//  Copyright © 2019 FZH. All rights reserved.
//

#import "ZHTwoViewController.h"
#import "ZHThreeViewController.h"
@interface ZHTwoViewController ()

@end

@implementation ZHTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ZHThreeViewController *vc = [ZHThreeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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
