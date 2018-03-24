
//  ZP_ConfirmWebController.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/24.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "ZP_ConfirmWebController.h"
#import "PrefixHeader.pch"
@interface ZP_ConfirmWebController ()<UIWebViewDelegate> {
    UIWebView * webView;
}

@end

@implementation ZP_ConfirmWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = MyLocal(@"Payment is being made");
    [self initUI];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(adjustStatusBar:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
    
}

- (void)initUI {
    webView = [UIWebView new];
    [self.view addSubview: webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    webView.delegate = self;
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[_jump_HeadURL stringByAppendingString:@"?"]]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[_jump_URL dataUsingEncoding:NSUTF8StringEncoding]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"ic_bar_return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
}

// 返回
- (void)backAction {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:MyLocal(@"Are you sure you want to quit") preferredStyle:UIAlertControllerStyleAlert];
    NSArray * array = [self.navigationController viewControllers];
    UIViewController * viewController = array.firstObject;
    [alert addAction:[UIAlertAction actionWithTitle:MyLocal(@"ok") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [SVProgressHUD dismiss];
        webView.delegate = nil;  // 退出停止加载Web，不然没加载完，退出了内存还在跑加载，容易内存泄漏
        [self.navigationController popToRootViewControllerAnimated:NO];
        viewController.tabBarController.selectedIndex = 3;
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:MyLocal(@"cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    [SVProgressHUD dismiss];
}

#pragma mark -UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"当前连接--》%@",request.URL.absoluteString);
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD showWithStatus:MyLocal(@"Trying to load ing... Just a moment, please.")]; // 菊花
    });
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [super viewWillDisappear:webView];
    [SVProgressHUD dismiss];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"连接失败%@",error);
    [SVProgressHUD dismiss];
    
}
// 热点被接入，子类重写
- (void)adjustStatusBar:(NSNotification *)notification {
    NSValue * rectValue = [notification.userInfo objectForKey:UIApplicationStatusBarFrameUserInfoKey];
    CGRect statusRect = [rectValue CGRectValue];
    CGFloat height = statusRect.size.height;
    if (height > 20) {
        appD.window.frame = CGRectMake(0, 0, ZP_Width, ZP_height);
    }else{
        appD.window.frame = CGRectMake(0, 0, ZP_Width, ZP_height);
    }
}
@end
