//
//  PromptBoxView.m
//  DDAYGO
//
//  Created by 小树普惠 on 2018/3/9.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import "PromptBoxView.h"
#import "PrefixHeader.pch"
#import "LoginController.h"
@interface PromptBoxView ()

@end

@implementation PromptBoxView

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 互踢：弹出对话框
- (void) logouttt {
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:MyLocal(@"Prompt") message:MyLocal(@"Your account has been logged in other places, you have been forced to go offline, please change the password as soon as possible if you are not logged in.") preferredStyle:UIAlertControllerStyleAlert];
    // 确定
    _okAction = [UIAlertAction actionWithTitle:MyLocal(@"Determine") style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        [self ClearANDJump:NO];
//        DD_CHECK_HASLONGIN;
    }];
    //    取消
    _cancelAction =[UIAlertAction actionWithTitle:MyLocal(@"Cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self ClearANDJump:YES];
    }];
    [alert addAction:_okAction];
    [alert addAction:_cancelAction];
    // 弹出对话框
    [self presentViewController:alert animated:true completion:nil];
}

//清除与跳转
- (void)ClearANDJump:(BOOL)isCancel {
    [self DeleteData];
    [self Jump:isCancel];
}

//清除数据
- (void)DeleteData {
    //        清除所有的数据
    Token = nil;
    DDAYGO_REMOVE_TOKEN; DDAYGO_REMOVE_SYMBOL; DDAYGO_REMOVE_COUNTRYCODE; DDAYGO_REMOVE_ICUETOKEN; DDAYGO_REMOVE_STATE; DDAYGO_REMOVE_HEADERIMAGE; DDAYGO_REMOVE_NAMELABEL; DD_ChangeStaus;
    ZPICUEToken = nil;
    [[SDImageCache sharedImageCache] clearDisk];
}

// 跳转到指定界面
- (void)Jump:(BOOL)isCancel {
    //        跳转到指定界面
    if (isCancel) {
        [self.navigationController popToRootViewControllerAnimated:NO];
        if ([[[UIApplication sharedApplication] keyWindow].rootViewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController * tbvc = [[UIApplication sharedApplication] keyWindow].rootViewController;
            [tbvc setSelectedIndex:0];
        }
    } else {
        LoginController *vc = [LoginController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
