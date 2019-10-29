//
//  ZHViewController.m
//  FZHBlockLink
//
//  Created by Mac on 2019/8/12.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHViewController.h"
#import <WebKit/WebKit.h>

@interface ZHViewController ()
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic,assign) BOOL runloopMark;

@end

@implementation ZHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scroll];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    view.backgroundColor = [UIColor redColor];
//    [self.scroll addSubview:view];
//
//    [self.scroll addSubview:self.imageView];
    
    NSLog(@"%@",[self changeToDate:[NSDate date]]);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(useTakeScreenShot:) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
//    WKWebViewConfiguration
    
    [self setConfigWeb];
//    self.webView.UIDelegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://view.csslcloud.net/api/view/callback?recordid=B2686C60AD2D62CD&roomid=41293D1845E4D1269C33DC5901307461&userid=AD701F3E79C9B5EE&autoLogin=true&viewername=%E4%B8%80%E5%8F%B6%E7%9F%A5%E7%A7%8B&viewertoken=**"]]];
    [self.view addSubview:self.webView];
//    [self.webView loadHTMLString:@"" baseURL:[NSURL URLWithString:@"https://view.csslcloud.net/api/view/callback?recordid=B2686C60AD2D62CD&roomid=41293D1845E4D1269C33DC5901307461&userid=AD701F3E79C9B5EE&autoLogin=true&viewername=%E4%B8%80%E5%8F%B6%E7%9F%A5%E7%A7%8B&viewertoken=**"]];
    self.runloopMark= YES;
    NSLog(@"1");
    
    __weak typeof(self) ws = self;
    [self.webView evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"uuu:%@",result);
        NSLog(@"2");
        ws.runloopMark = NO;
    }];
    
    
    while (self.runloopMark) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"===========");
    }
    
    NSLog(@"3");

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@",change);
}
    
    
- (void)checkRunloopmark
{
    while (self.runloopMark) {
        
    }
}

- (void)setConfigWeb
{
    //创建网页配置对象
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    
    // 创建设置对象
    WKPreferences *preference = [[WKPreferences alloc]init];
    //最小字体大小 当将javaScriptEnabled属性设置为NO时，可以看到明显的效果
    preference.minimumFontSize = 0;
    //设置是否支持javaScript 默认是支持的
    preference.javaScriptEnabled = YES;
    // 在iOS上默认为NO，表示是否允许不经过用户交互由javaScript自动打开窗口
    preference.javaScriptCanOpenWindowsAutomatically = YES;
    config.preferences = preference;
    
    // 是使用h5的视频播放器在线播放, 还是使用原生播放器全屏播放
    config.allowsInlineMediaPlayback = YES;
    //设置视频是否需要用户手动播放  设置为NO则会允许自动播放
    config.mediaTypesRequiringUserActionForPlayback = NO;
    //设置是否允许画中画技术 在特定设备上有效
    config.allowsPictureInPictureMediaPlayback = YES;
    //设置请求的User-Agent信息中应用程序名称 iOS9后可用
    config.applicationNameForUserAgent = @"ChinaDailyForiPhone";
    //自定义的WKScriptMessageHandler 是为了解决内存不释放的问题
//    WeakWebViewScriptMessageDelegate *weakScriptMessageDelegate = [[WeakWebViewScriptMessageDelegate alloc] initWithDelegate:self];
    //这个类主要用来做native与JavaScript的交互管理
    WKUserContentController * wkUController = [[WKUserContentController alloc] init];
    //注册一个name为jsToOcNoPrams的js方法
//    [wkUController addScriptMessageHandler:weakScriptMessageDelegate  name:@"jsToOcNoPrams"];
//    [wkUController addScriptMessageHandler:weakScriptMessageDelegate  name:@"jsToOcWithPrams"];
    config.userContentController = wkUController;
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
}




- (NSDate *)changeToDate:(NSDate *)d
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    dateFormat.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    NSMutableDictionary *abbs = [[NSMutableDictionary alloc] init];
    [abbs setValuesForKeysWithDictionary:[NSTimeZone abbreviationDictionary]];
    [abbs setValue:@"Asia/Shanghai" forKey:@"CCD"];
    [NSTimeZone setAbbreviationDictionary:abbs];
    NSString *date = [dateFormat stringFromDate:d];
    return [dateFormat dateFromString:date];
}


- (void)useTakeScreenShot:(NSNotification *)notification
{
    NSLog(@"劳资截屏了%@",notification);
    UIImage *image = [self screenShot];
    
    self.imageView.image = image;
}



/**
 *  截取当前屏幕
 *
 *  @return NSData *
 */
- (NSData *)dataWithScreenshotInPNGFormat
{
    CGSize imageSize = CGSizeZero;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
        imageSize = [UIScreen mainScreen].bounds.size;
    else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        if (orientation == UIInterfaceOrientationLandscapeLeft)
        {
            CGContextRotateCTM(context, M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        }
        else if (orientation == UIInterfaceOrientationLandscapeRight)
        {
            CGContextRotateCTM(context, -M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGContextRotateCTM(context, M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        {
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        }
        else
        {
            [window.layer renderInContext:context];
        }
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return UIImagePNGRepresentation(image);
}

/**
 *  返回截取到的图片
 *
 *  @return UIImage *
 */
- (UIImage *)imageWithScreenshot
{
    NSData *imageData = [self dataWithScreenshotInPNGFormat];
    return [UIImage imageWithData:imageData];
}

- (UIImage *)screenShot
{
    UIImage * image[2];
    for (int i = 0; i < 2; i++) {
        if (i == 0) {
            // 获得状态栏view的上下文以绘制图片
            UIView *statusBarView = [[UIApplication sharedApplication] valueForKey:@"_statusBar"];
            UIGraphicsBeginImageContext(statusBarView.frame.size);
            [statusBarView.layer renderInContext:UIGraphicsGetCurrentContext()];
            image[i] = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        } else {
            // 获得其他所有window，包括键盘，的上下文并绘制图片
            CGSize roomViewSize = [UIScreen mainScreen].bounds.size;
            UIGraphicsBeginImageContextWithOptions(roomViewSize, NO, 0);
            for (UIWindow *window in [UIApplication sharedApplication].windows) {
                if (![window respondsToSelector:@selector(screen)] || window.screen == [UIScreen mainScreen]) {
                    [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
                }
            }
            image[i] = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
    }
    // 将上面得到的两张图片合并绘制为一张图片，最终得到screenshotImage
    UIGraphicsBeginImageContext(image[1].size);
    [image[1] drawInRect:CGRectMake(0, 0, image[1].size.width, image[1].size.height)];
    [image[0] drawInRect:CGRectMake(0, 0, image[0].size.width, image[0].size.height)];
    UIImage *screenshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshotImage;
}

-(UIScrollView *)scroll
{
    if (!_scroll) {
        _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
        
        _scroll.contentSize = CGSizeMake(375, 667 * 2);
    }
    return _scroll;
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 375 / 2, 667 / 2)];
    }
    return _imageView;
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
