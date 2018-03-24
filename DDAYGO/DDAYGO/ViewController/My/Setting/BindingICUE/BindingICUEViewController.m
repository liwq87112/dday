//
//  BindingICUEViewController.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/22.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "BindingICUEViewController.h"
//#import "DialogBox.h"
#import "DialogBox.h"
#import "ZP_MyTool.h"
#import "PrefixHeader.pch"
@interface BindingICUEViewController ()

@end

@implementation BindingICUEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ButStatusAttribute];
    [self initUI];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(adjustStatusBar:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

// UI
- (void)initUI {
    self.title = MyLocal(@"ICUC binding");
    self.PassWordtextField.secureTextEntry = YES;
    _AccountnumbertextField.keyboardType = UIKeyboardTypeASCIICapable;
    self.AccountnumbertextField.clearButtonMode = UITextFieldViewModeWhileEditing;  // 一键删除文字
    self.PassWordtextField.clearButtonMode = UITextFieldViewModeWhileEditing;  // 一键删除文字
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:ZP_textWite}];   // 更改导航栏字体颜色
    self.BindingICUEscrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag; // 滚动时键盘隐藏
}

// 按钮状态属性
- (void)ButStatusAttribute {
    self.BindingBut.alpha = 0.5;
    self.BindingBut.userInteractionEnabled = NO;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ButStatus:) name:UITextFieldTextDidChangeNotification object:self.PassWordtextField];
}

- (void)ButStatus:(UIButton *)sender {
    if (self.PassWordtextField.text.length > 0) {
        self.BindingBut.userInteractionEnabled = YES;
        self.BindingBut.alpha = 1;
    }else {
        self.BindingBut.userInteractionEnabled = NO;
        self.BindingBut.alpha = 0.5;
    }
}

- (IBAction)buildingAction:(id)sender {
#pragma make -- 提示框
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:MyLocal(@"reminding") message:MyLocal(@"The ICUE account will not be changed once it is bound. Are you sure you want to bind this ICUE account?") preferredStyle:UIAlertControllerStyleAlert];
    
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

// 数据
- (void)allData {
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"icueaccount"] = [self.AccountnumbertextField.text stringByReplacingOccurrencesOfString:@" " withString:@""]; // 防止輸入帶有空格
    dic[@"pwd"] = [self.PassWordtextField.text stringByReplacingOccurrencesOfString:@" " withString:@""]; // 防止輸入帶有空格
    dic[@"token"] = Token;
    ZPLog(@"%@",dic);
    [ZP_MyTool requestBindingICUE:dic success:^(id obj) {
        NSDictionary * dic = obj;
        if ([dic[@"result"] isEqualToString:@"ok"]) {
            ZPLog(@"加入成功");
            [SVProgressHUD showSuccessWithStatus:MyLocal(@"Binding success")];
            [self.navigationController popViewControllerAnimated:YES];
        }else
            if ([dic[@"result"]isEqualToString:@"icue_err"]) {
                ZPLog(@"icue_err：icue號已被綁定");
                [SVProgressHUD showInfoWithStatus:MyLocal(@"ICUE has been bound.")];
            }else
                if ([dic[@"result"]isEqualToString:@"acc_pwd_err"]) {
                    [SVProgressHUD showInfoWithStatus:MyLocal(@"Account or password error.")];
                    ZPLog(@"acc_pwd_err：账号密码错误");
                }else
                    if ([dic[@"result"]isEqualToString:@"invalid_user"]) {
                        [SVProgressHUD showInfoWithStatus:MyLocal(@"Invalid account")];
                        ZPLog(@"invalid_user:无效的账户");
                    }else
                        if ([dic[@"result"]isEqualToString:@"black_account"]) {
                            [SVProgressHUD showInfoWithStatus:MyLocal(@"Blacklist user")];
                            ZPLog(@"black_account：黑名单用户");
                        }else
                            if ([dic[@"result"]isEqualToString:@"account_notexist"]) {
                                [SVProgressHUD showInfoWithStatus:MyLocal(@"account does not exist")];
                                ZPLog(@"account_notexist：账户不存在");
                            }
    } failure:^(NSError * error) {
        
    }];
}
#pragma mark -- 安全输入
- (IBAction)showPwAction:(UIButton *)sender {
    _PassWordtextField.secureTextEntry = sender.selected;
    sender.selected =!sender.selected;
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
