//
//  BindingIntroduce.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/27.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "BindingIntroduce.h"
#import "PromptBox.h"
#import "ZP_MyTool.h"
#import "PrefixHeader.pch"
@interface BindingIntroduce ()

@end

@implementation BindingIntroduce

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ButStatusAttribute];
    self.title = MyLocal(@"referrer", nil);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:ZP_textWite}];   // 更改导航栏字体颜色
    self.BindingIntroduceTextField.keyboardType = UIKeyboardTypeASCIICapable;
    self.BindingIntroduceTextField.clearButtonMode = UITextFieldViewModeWhileEditing;  // 一键删除文字
    self.BindingIntroducscrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag; // 滚动时键盘隐藏
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(adjustStatusBar:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

// 按钮状态属性
- (void)ButStatusAttribute {
    self.BinDingBut.alpha = 0.5;
    self.BinDingBut.userInteractionEnabled = NO;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ButStatus:) name:UITextFieldTextDidChangeNotification object:self.BindingIntroduceTextField];
}

- (void)ButStatus:(UIButton *)sender {
    if (self.BindingIntroduceTextField.text.length > 0) {
        self.BinDingBut.userInteractionEnabled = YES;
        self.BinDingBut.alpha = 1;
    }else {
        self.BinDingBut.userInteractionEnabled = NO;
        self.BinDingBut.alpha = 0.5;
    }
}
// 绑定推荐人
- (IBAction)BindingIntroduceTextField:(id)sender {
#pragma make -- 提示框
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"reminding", nil) message:MyLocal(@"introducer will not be able to change once it is bound. Are you sure you want to bind this reference?") preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:MyLocal(@"cancel") style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        ZPLog(@"取消");
    }];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:MyLocal(@"ok") style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [SVProgressHUD showWithStatus:MyLocal(@"Please later…")];
        [self allData];
    }];
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)allData {
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"acc"] = self.BindingIntroduceTextField.text;
    dic[@"token"] = Token;
    [ZP_MyTool requesIntroduce:dic success:^(id obj) {
        NSDictionary * dic = obj;
        if ([dic[@"result"]isEqualToString:@"ok"]) {
            [SVProgressHUD showSuccessWithStatus:MyLocal(@"Binding success")];
            [self.navigationController popViewControllerAnimated:YES];
        }else
            if ([dic[@"result"]isEqualToString:@"failure"]) {
                [SVProgressHUD showInfoWithStatus:MyLocal(@"Binding failure")];
            }else
                if ([dic[@"result"]isEqualToString:@"no"]) {
                    [SVProgressHUD showInfoWithStatus:MyLocal(@"account does not exist")];
                }else
                    if ([dic[@"result"]isEqualToString:@"abnormal_message"]) {
                        [SVProgressHUD showInfoWithStatus:MyLocal(@"Exception information")];
                    }else
                        //*************************************Token被挤掉***************************************************//
                        if ([obj[@"result"]isEqualToString:@"token_not_exist"]) {
                            //        清除所有的数据
                            Token = nil;
                            DDAYGO_REMOVE_TOKEN; DDAYGO_REMOVE_SYMBOL; DDAYGO_REMOVE_COUNTRYCODE; DDAYGO_REMOVE_ICUETOKEN; DDAYGO_REMOVE_STATE; DDAYGO_REMOVE_HEADERIMAGE; DDAYGO_REMOVE_NAMELABEL; DD_ChangeStaus;
                            ZPICUEToken = nil;
                            [[SDImageCache sharedImageCache] clearDisk];
#pragma make -- 提示框
                            [self logouttt];
                        }
    } failure:^(NSError * error) {
        
    }];
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
