//
//  YueTixianController.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/4.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "YueTixianController.h"
#import "ZP_ExtractController.h"
#import "PrefixHeader.pch"
#import "ZP_MyTool.h"
@interface YueTixianController ()<UITextFieldDelegate>

@end

@implementation YueTixianController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(adjustStatusBar:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

- (void)initUI {
    self.title = MyLocal(@"extract");
    UIBarButtonItem * ExtractBut = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_withdrawals_record"] style:UIBarButtonItemStyleDone target:self action:@selector(Extract)];
    ExtractBut.tintColor = ZP_WhiteColor;
    self.amountText.keyboardType = UIKeyboardTypeNumberPad;
    self.PaymentAccountText.keyboardType = UIKeyboardTypeNumberPad;
    self.reservedPhoneText.keyboardType = UIKeyboardTypeNumberPad;
    self.emailText.keyboardType = UIKeyboardTypeASCIICapable;
    self.navigationItem.rightBarButtonItem = ExtractBut;
    self.TikuanscrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag; // 滚动时键盘隐藏
}

- (void)Extract {
    ZPLog(@"跳转");
    ZP_ExtractController * Extract = [[ZP_ExtractController alloc]init];
    Extract.supplierId = self.SupplierId;
    [self.navigationController pushViewController:Extract animated:YES];
}

- (IBAction)CompleteButton:(id)sender {
    //这个是判断金额不能小于1
    if ([_amountText.textField.text intValue] < 1) {
        [SVProgressHUD showInfoWithStatus:MyLocal(@"Please enter the correct amount.")];
        return;
    }
    // 这个是判断 至少输入一个 字
    if (_payeeText.textField.text.length < 1) {
        [SVProgressHUD showInfoWithStatus:MyLocal(@"Please enter the contact person")];
        return;
    }
    if (_CollectingBankText.textField.text.length < 1) {
        [SVProgressHUD showInfoWithStatus:MyLocal(@"Please enter the receiving bank.")];
        return;
    }
    if (_PaymentAccountText.textField.text.length < 1) {
        [SVProgressHUD showInfoWithStatus:MyLocal(@"Please enter your account number.")];
        return;
    }
    if (_reservedPhoneText.textField.text.length  < 1) {
        [SVProgressHUD showInfoWithStatus:MyLocal(@"Please enter the telephone")];
        return;
    }
    if (![self validateEmail:_emailText.textField.text]) {
        [SVProgressHUD showInfoWithStatus:MyLocal(@"Incorrect email format.")];
        return;
    }
    if (_emailText.textField.text.length < 1) {
        [SVProgressHUD showInfoWithStatus:MyLocal(@"Please enter email")];
        return;
    }
    [self AllData];
}

// 数据
- (void)AllData {
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"token"] = Token;
    dic[@"sid"] = _SupplierId;
    dic[@"amount"] = _amountText.textField.text;
    dic[@"bankcardname"] = [_payeeText.textField.text stringByAddingPercentEscapesUsingEncoding:kCFStringEncodingUTF8];
    //    NSUTF8StringEncoding
    dic[@"bankname"] = [_CollectingBankText.textField.text stringByAddingPercentEscapesUsingEncoding:kCFStringEncodingUTF8];
    dic[@"bankcardno"] = _PaymentAccountText.textField.text;
    dic[@"phone"] = _reservedPhoneText.textField.text;
    dic[@"email"] = _emailText.textField.text;
    
    [ZP_MyTool requesAddSupplierTakeOut:dic success:^(id obj) {
        if ([obj[@"result"]isEqualToString:@"ok"]) {
            [SVProgressHUD showSuccessWithStatus:MyLocal(@"Application successful")];
            [self.navigationController popViewControllerAnimated:YES];
        }else
            if ([obj[@"result"]isEqualToString:@"apply_count_err"]) {
                [SVProgressHUD showInfoWithStatus:MyLocal(@"Exceed daily withdrawal times daily limit.")];
            }else
                if ([obj[@"result"]isEqualToString:@"takeamount_err"]) {
                    [SVProgressHUD showInfoWithStatus:MyLocal(@"withdrawal amount is insufficient")];
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
        //****************************************************************************************//
    } failure:^(NSError *error) {
        NSLog(@"error %@",error);
    }];
}

#pragma mark - - - - - - - - - - - - - - - private methods 私有方法 - - - - - - - - - - - - - -
- (BOOL)validateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
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

