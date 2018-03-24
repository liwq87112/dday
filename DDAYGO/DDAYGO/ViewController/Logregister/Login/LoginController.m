//
//  LoginController.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/17.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "LoginController.h"
#import "TextView.h"
#import "ForgetPswController.h"
#import "PrefixHeader.pch"
#import "UINavigationBar+Awesome.h"
#import "ZP_LoginTool.h"
@interface LoginController () {
    BOOL keyboardIsShown;
}

@property (weak, nonatomic) IBOutlet TextView * ZPEmailTextField;
@property (weak, nonatomic) IBOutlet TextView * ZPPswTextField;
@property (weak, nonatomic) IBOutlet UIButton * LoginBtn;
@property (nonatomic, strong) UIView * Boview;


@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    self.title = NSLocalizedString(@"Login", nil) ;
    self.ZPEmailTextField.textField.placeholder = MyLocal(@"ZPEmailTextFieldID");
    self.ZPPswTextField.textField.placeholder = MyLocal(@"ZPPswTextFieldID");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:ZP_textWite}];   // 更改导航栏字体颜色
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];  // 隐藏返回按钮上的文字
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar lt_setBackgroundColor:ZP_NavigationCorlor];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(adjustStatusBar:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}

// UI
- (void)initUI {
    //    _LoginBtn.layer.cornerRadius             = 8.0;
    //    _LoginBtn.layer.masksToBounds            = YES;
    [self ButStatusAttribute];
    self.ZPEmailTextField.textField.keyboardType =  UIKeyboardTypeASCIICapable;
    
    self.ZPPswTextField.textField.keyboardType = UIKeyboardTypeDefault;
    self.ZPPswTextField.showBtn                  = NO;
    self.ZPPswTextField.showEyeBtn               = YES;
    [self.ZPPswTextField.functionBtn addTarget:self action:@selector(secureTextEntry) forControlEvents:UIControlEventTouchUpInside];
}

// 按钮状态属性
- (void)ButStatusAttribute {
    self.LoginBtn.alpha = 0.5;
    self.LoginBtn.userInteractionEnabled = NO;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ButStatus:) name:UITextFieldTextDidChangeNotification object:self.ZPPswTextField.textField];
}
- (void)ButStatus:(UIButton *)sender {
    if (self.ZPPswTextField.textField.text.length > 0) {
        self.LoginBtn.userInteractionEnabled = YES;
        self.LoginBtn.alpha = 1;
    }else {
        self.LoginBtn.userInteractionEnabled = NO;
        self.LoginBtn.alpha = 0.5;
    }
}

// 确定按钮
- (IBAction)LoginClick:(id)sender {
    [SVProgressHUD showWithStatus: MyLocal(@"Logging in...")];
    [self allData];
}
// 数据
- (void)allData {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"email"] = [self.ZPEmailTextField.textField.text stringByReplacingOccurrencesOfString:@" " withString:@""]; // 防止輸入帶有空格
    dic[@"pwd"] = [self md5:self.ZPPswTextField.textField.text];
    dic[@"countrycode"] = CountCode;
    //    NSLog(@"count %@",CountCode);
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:@"loginData"];
    [ZP_LoginTool requestLogin:dic success:^(id obj) {
        NSLog(@"obj---%@",obj);
        if ([obj[@"result"]isEqualToString:@"ok"]) {
            NSDictionary * aadic = obj;
            Token = aadic[@"token"];
            [[NSUserDefaults standardUserDefaults] setObject:Token forKey:@"token"];// Token缓存本地
            [[NSUserDefaults standardUserDefaults] synchronize]; // Token缓存本地
            [[NSUserDefaults standardUserDefaults] setObject:aadic[@"symbol"] forKey:@"symbol"]; // 货币缓存本地
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[NSUserDefaults standardUserDefaults] setObject:aadic[@"result"] forKey:@"result"]; // 是否是供货商
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[NSUserDefaults standardUserDefaults] setObject:aadic[@"countrycode"] forKey:@"countrycode"];  // 国别缓存本地
            [[NSUserDefaults standardUserDefaults] setObject:aadic[@"countryname"] forKey:@"countryname"];  // 国名本地
            [[NSNotificationCenter defaultCenter] postNotificationName:@"changeStaus" object:nil userInfo:@{@"countryname":obj[@"countryname"]}];
            [[NSUserDefaults standardUserDefaults] synchronize];  // 国别缓存本地
            [self performSelector:@selector(pushSecondController) withObject:nil afterDelay:1.5f]; //设置加载完成后再跳转
            NSArray * array = self.navigationController.viewControllers;
            if (array.count > 2) {
                [self.navigationController popToViewController:array[array.count-3] animated:YES];
            } else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }else {
            if ([obj[@"result"]isEqualToString:@"failure"]) {
                [SVProgressHUD showInfoWithStatus:MyLocal(@"Login failed")];
            }else {
                if ([obj[@"result"]isEqualToString:@"acc_pwd_err"]) {
                    [SVProgressHUD showInfoWithStatus:MyLocal(@"Account or password error.")];
                }else {
                    if ([obj[@"result"]isEqualToString:@"acc_null_err"]) {
                        [SVProgressHUD showInfoWithStatus:MyLocal(@"Account is empty")];
                    }else {
                        if ([obj[@"result"]isEqualToString:@"pwd_null_err"]) {
                            [SVProgressHUD showInfoWithStatus:MyLocal(@"Password is empty")];
                        }else {
                            if ([obj[@"result"]isEqualToString:@"sys_err"]) {
                                [SVProgressHUD showInfoWithStatus:MyLocal(@"System error")];
                            }else {
                                if ([obj[@"result"]isEqualToString:@"token_err"]) {
                                    [SVProgressHUD showInfoWithStatus:MyLocal(@"Token existing")];
                                }
                            }
                        }
                    }
                }
            }
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
- (void)pushSecondController {
    [SVProgressHUD showSuccessWithStatus:MyLocal(@"Login successful")];
}
- (IBAction)forgetPsdClick:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    ForgetPswController * forget = [[ForgetPswController alloc]init];
    [self.navigationController pushViewController:forget animated:YES];
    self.hidesBottomBarWhenPushed = YES;
}

#pragma mark - - - - - - - - - - - - - - - private methods 私有方法 - - - - - - - - - - - - - -
- (BOOL)validateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (BOOL)judgePassWordLegal:(NSString *)pass {
    BOOL result ;
    // 判断长度大于8位后再接着判断是否同时包含数字和大小写字母
    NSString * regex =@"(?![0-9A-Z]+$)(?![0-9a-z]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    result = [pred evaluateWithObject:pass];
    return result;
}

//  MD5加密方法
-(NSString *)md5:(NSString *)input {
    const char * cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    //    CC_MD5(cStr, strlen(cStr),digest); // This is the md5 call
    CC_MD5(cStr, (CC_LONG)strlen(cStr),digest); // This is the md5 call
    NSMutableString * output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH *2];
    for (int i = 0; i<CC_MD5_DIGEST_LENGTH; i ++) {
        [output appendFormat:@"%02x",digest[i]];
    }
    return output;
}

#pragma mark - 安全输入
-(void)secureTextEntry {
    self.ZPPswTextField.textField.secureTextEntry = !self.ZPPswTextField.textField.secureTextEntry;
    if (self.ZPPswTextField.textField.secureTextEntry) {
        [self.ZPPswTextField.functionBtn setImage:[UIImage imageNamed:@"ic_login_close.png"] forState:UIControlStateNormal];
    }else {
        [self.ZPPswTextField.functionBtn setImage:[UIImage imageNamed:@"ic_login_open.png"] forState:UIControlStateNormal];
    }
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

