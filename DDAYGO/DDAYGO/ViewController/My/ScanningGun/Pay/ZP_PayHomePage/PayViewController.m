//
//  PayViewController.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/10.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "PayViewController.h"
#import "PayViewCell.h"
#import "PrefixHeader.pch"
#import "UINavigationBar+Awesome.h"
#import "ZP_MyTool.h"
#import "DataViewController.h"
#import "ZP_PayView.h"
#import "ZP_shoopingTool.h"
#import "ZP_PayModel.h"
@interface PayViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSString * money;
}
@property (nonatomic, strong)NSMutableArray * dataArrar;
@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArrar = [NSMutableArray array];
    [self initUI];
    [self AllData];
    self.title = MyLocal(@"Payment is being made", nil);
    self.view.backgroundColor = ZP_WhiteColor;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: ZP_textWite}];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"ic_bar_return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(adjustStatusBar:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

- (void)backAction {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
// 數據
- (void)AllData {
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"token"] = Token;
    dic[@"shopname"] = self.Oname;
    dic[@"shopcode"] = self.Oid;
    ZPLog(@"%@_%@",dic[@"shopname"] = self.Oname,dic[@"shopcode"] = self.Oid);
}
//  点击确认按钮需要的参数
- (void)btnClick {
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"countrycode"] = @"886";
    [ZP_shoopingTool requetMethodpay:dic success:^(id obj) {
        _dataArrar = [ZP_PayModel arrayWithArray:obj];
        ZP_PayView * payView = [[ZP_PayView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        payView.AmountLabel.text = money;
        payView.dataArray = _dataArrar;
        //        payView.
        payView.confirmPayBlock = ^(id response) {
        };
        payView.ConfirmPayMoneyBlock = ^(id response) {
            ZP_PayModel * model = response;
            //            ZP_PayModel * modell = _dataArrar[0];
            NSMutableDictionary * dic = [NSMutableDictionary dictionary];
            dic[@"token"] = Token;
            dic[@"amount"] = money; // 这个是在view上选择支付金额（手动输入）
            dic[@"shopcode"] = self.Oid; // 这个必须要
            dic[@"countrycode"] = @"886";
            //    dic[@"payway"] = @"esafe_creditcard";   // 这个是在view上选择支付方式
            dic[@"payway"] = model.payid;
            dic[@"icuetoken"] = ZPICUEToken;
            __weak typeof(payView) weakView = payView;
            //    这是是在选择支付方式后点击确定后跳转的数据加OID回调
            [ZP_MyTool requesQrCodePay:dic success:^(id obj) {
                if ([obj[@"result"]isEqualToString:@"ok"]) {
                    NSLog(@"obj = %@",obj);
                    DataViewController * web = [[DataViewController alloc]init];
                    web.jump_URL = obj[@"para"];
                    web.jump_HeadURL = obj[@"uri"];
                    web.Oid = obj[@"oid"];
                    [weakView removeView];
                    [self.navigationController pushViewController:web animated:YES];
                }else
                    if ([obj[@"result"]isEqualToString:@"country_err"]) {
                        [SVProgressHUD showInfoWithStatus:MyLocal(@"Country mismatch")];
                    }else
                        if ([obj[@"result"]isEqualToString:@"payamount_err"]) {
                            [SVProgressHUD showInfoWithStatus:MyLocal(@"Payment method error")];
                        }else
                            if ([obj[@"result"]isEqualToString:@"icuetoken_err"]) {
                                [SVProgressHUD showInfoWithStatus:MyLocal(@"ICUE identity error.")];
                            }else
                                if ([obj[@"result"]isEqualToString:@"shopcode_err"]) {
                                    [SVProgressHUD showInfoWithStatus:MyLocal(@"Qr code error, wrong merchant ID.")];
                                }else
                                    if ([obj[@"result"]isEqualToString:@"qrpay_state_err"]) {
                                        [SVProgressHUD showInfoWithStatus:MyLocal(@"merchant has closed the scan code payment.")];
                                    }else
                                        if ([obj[@"result"]isEqualToString:@"qrpay_state_err"]) {
                                            [SVProgressHUD showInfoWithStatus:MyLocal(@"amount of payment must be greater than 0.")];
                                        }else
                                            if ([obj[@"result"]isEqualToString:@"addorder_err"]) {
                                                [SVProgressHUD showInfoWithStatus:MyLocal(@"Order generation failed")];
                                            }
            } failure:^(NSError *error) {
                NSLog(@"error = %@",error);
            }];
        };
        ZPLog(@"%@",obj);
        [payView showInView:self.view];
        //        [self.tableView reloadData];
    } failure:^(NSError * error) {
        ZPLog(@"%@",error);
    }];
    
}

// UI
- (void)initUI {
    [self.tableView registerNib:[UINib nibWithNibName:@"PayViewCell" bundle:nil] forCellReuseIdentifier:@"PayViewCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = ZP_WhiteColor;
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor orangeColor]];
}

#pragma mark - tableviewDelegat
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PayViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PayViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;  //取消Cell点击变灰效果
    [cell initWithName:self.Oname NameId:_Oname];
    cell.PayBlock = ^(NSString * text) {
        money = text;
        [self btnClick];
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 350;
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
