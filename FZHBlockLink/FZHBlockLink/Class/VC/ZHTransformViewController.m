//
//  ZHTransformViewController.m
//  FZHBlockLink
//
//  Created by Mac on 2019/8/12.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHTransformViewController.h"
#import "ZHMediator.h"
@interface ZHTransformViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ZHTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
   
}
- (IBAction)rotationClick:(UIButton *)sender {
    
    static float rot = 0.0f;
    rot += 2;
    CATransform3D transform = CATransform3DMakeRotation(rot, 0, 0 , 1);
    self.imageView.layer.transform = transform;
    
}
- (IBAction)translateClick:(UIButton *)sender {
    
    static float rot = 0.0f;
    rot += 2;
    CATransform3D transform = CATransform3DTranslate(self.imageView.layer.transform, rot, rot, 1.0);
    self.imageView.layer.transform = transform;
}
- (IBAction)scaleClick:(UIButton *)sender {
    static float rot = 0.0f;
    rot += 0.1;
    CATransform3D transform = CATransform3DScale(self.imageView.layer.transform, rot, rot, 1.0);
    self.imageView.layer.transform = transform;
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0/500.0;
    
    static float rot = 0;
    
    rot += 10;
    transform = CATransform3DRotate(transform, degreeToradians(rot), 0, 1, 0);
    
    
    self.imageView.layer.transform =transform;
    
    [ZHMediator Mediator_performTargetName:@"ZHMetalManager" actionName:@"log:" params:@{@"id":@"1", @"name":@"leeDev",@"ida":@"1"}];
}


static CGFloat degreeToradians(CGFloat degree){
    
    return degree * M_PI / 180;
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
