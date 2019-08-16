//
//  ViewController.m
//  FZHBlockLink
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ViewController.h"
#import "ZHBlock.h"
#import "ZHBlockChain.h"

@interface ViewController ()
@property (strong, nonatomic)  UITextField *nameField;
@property (strong, nonatomic)  UITextField *pwdField;

@end

@implementation ViewController

-(NSInteger)plus:(NSInteger)num1 numb:(NSInteger)numb2
{
    num1 = num1 + 20;
    return num1 +numb2;
}

-(void)loadManyDatas
{
    // I/O流操作 耗时 性能需求
    for (NSInteger i = 0; i < 200; i ++) {
        NSLog(@"i am test performance");
    }
}

- (void)requestdata:(void (^)(id))dataBlock
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        NSString *str= @"i am zh";
        [NSThread sleepForTimeInterval:1];
        dispatch_async(dispatch_get_main_queue(), ^{
            dataBlock(str);
        });
    });
}
- (void)loginAction:(UIButton *)sender {
    NSLog(@"%@ %@",self.nameField.text,self.pwdField.text);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ZHBlock *block = [[ZHBlock alloc] initWithData:@"00"];
    ZHBlockChain *chain = [[ZHBlockChain alloc] initGen:block];
//    for (NSInteger i = 0; i < 10; i++) {
//        ZHBlock *block = [[ZHBlock alloc] initWithData:[NSString stringWithFormat:@"%ld",i]];
//        
//    }
    [self initUI];
}

- (void)initUI{
    
    self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(15, 80, 300, 30)];
    self.nameField.placeholder = @"请输入名字";
    [self.view addSubview:self.nameField];
    
    self.pwdField = [[UITextField alloc] initWithFrame:CGRectMake(15, 110 + 15, 300, 30)];
    self.pwdField.placeholder = @"请输入密码";
    [self.view addSubview:self.pwdField];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    btn.frame = CGRectMake(15, 125 + 30 +15 , 300, 30);
    [btn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

@end
