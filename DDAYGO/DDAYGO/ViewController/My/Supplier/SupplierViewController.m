//
//  SupplierViewController.m
//  DDAYGO
//
//  Created by Summer on 2017/12/28.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "SupplierViewController.h"
#import "SupplierTableViewCell.h"
#import "SupplierViewCell2.h"
#import "PrefixHeader.pch"
#import "ScreenView.h"
#import "SupplierViewCell.h"
#import "ZP_MyTool.h"
#import "ListBoxView.h"
@interface SupplierViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)NSArray * array;
@property (nonatomic, strong)NSArray * postionArray;
@property (nonatomic, strong) ListBoxView *listBoxView;
@end

@implementation SupplierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self alldata];
}

// 生命周期
- (void)viewWillDisappear:(BOOL)animated {
    
}
- (void)initUI {
    self.title = NSLocalizedString(@"供货商", nil);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:ZP_WhiteColor}];   // 更改导航栏字体颜色
    [self.navigationController.navigationBar lt_setBackgroundColor:ZP_NavigationCorlor];  //  更改导航栏颜色
    static NSString * SupplierID = @"SupplierTableViewCell";
    [self.tableview registerNib:[UINib nibWithNibName:SupplierID bundle:nil] forCellReuseIdentifier:SupplierID];
     [self.tableview registerNib:[UINib nibWithNibName:@"SupplierViewCell2" bundle:nil] forCellReuseIdentifier:@"SupplierViewCell2"];
    [self.tableview registerNib:[UINib nibWithNibName:@"SupplierViewCell" bundle:nil] forCellReuseIdentifier:@"SupplierViewCell"];
    
    _array = [NSArray arrayWithObjects:@"公司名稱:",@"統一編號:",@"公司人數:",@"註冊資本:",@"創立日期:",@"組織形態:",@"公司地址:",@"公司電話:",@"公司傳真(選填):",@"公司網址(選填):",@"聯繫人:",@"聯繫電話:",@"經營項目:",@"合作項目:", nil];
    
}
// 數據
- (void)alldata {
//    DD_CHECK_HASLONGIN;
//    [ZP_MyTool requestUserBusinessStatus:DD_TOKEN success:^(id obj) {
//        NSDictionary *dic = obj;
//        if ([dic[@"resault"] isEqualToString:@"token_err"]) {
//            [SVProgressHUD showErrorWithStatus:@"token错误"];
//        } else if ([dic[@"resault"] isEqualToString:@"isagent"]) {
//            [SVProgressHUD showErrorWithStatus:@"账号是代理商不可申请供货商"];
//        } else if ([dic[@"resault"] isEqualToString:@"ok"]) {
//
//        }
//        NSLog(@"%@",obj);
//    } failure:^(NSError *error) {
//        NSLog(@"%@",error);
//    }];
}

#pragma mark --delegate
-  (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * myView = [[UIView alloc]init];
    self.tableview.tableHeaderView = myView; // 表头跟着cell一起滚动
    [myView setBackgroundColor:ZP_customWite];
    
    UIImageView * imageview = [UIImageView new];
    [myView addSubview:imageview];
    imageview.image = [UIImage imageNamed:@"icon_business_country"];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(myView).offset(8);
        make.top.equalTo(myView).offset(10);
        make.width.mas_offset(25);
        make.height.mas_offset(25);
    }];
    
    ZP_GeneralLabel * titleLabel = [ZP_GeneralLabel initWithtextLabel:_titleLabel.text textColor:ZP_textblack font:ZP_stockFont textAlignment:NSTextAlignmentLeft bakcgroundColor:nil];
    titleLabel.text = NSLocalizedString(@"所在國家:", nil);
    [myView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageview).offset(30);
        make.top.equalTo(imageview).offset(0);
        make.height.mas_offset(25);
    }];
    
    ZP_GeneralLabel * CountriesLabel = [ZP_GeneralLabel initWithtextLabel:_CountriesLabel.text textColor:ZP_textblack font:ZP_stockFont textAlignment:NSTextAlignmentLeft bakcgroundColor:nil];
    CountriesLabel.text = NSLocalizedString(@"臺灣", nil);
    _CountriesLabel = CountriesLabel;
    [myView addSubview:CountriesLabel];
    [CountriesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel).offset(60);
        make.top.equalTo(titleLabel).offset(0);
        make.height.mas_offset(25);
    }];
    return myView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 22;
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * SupplierID = @"SupplierTableViewCell";
    SupplierTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:SupplierID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;  //取消Cell点击变灰效果、
    if (indexPath.row == 0) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = ZP_customWite;
    }
    if (2 == indexPath.row) {
        cell.textField.placeholder = NSLocalizedString(@"如:50 - 100 人", nil);
    }
        if (4 == indexPath.row) {
            cell.textField.placeholder = NSLocalizedString(@"yyyy-MM-dd", nil);
    }
        if (5 == indexPath.row) {
            SupplierViewCell2 * cell2 = [tableView dequeueReusableCellWithIdentifier:@"SupplierViewCell2"];
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;  //取消Cell点击变灰效果、
            cell2.TissueMorphologyLabel.text = @"请选择组织形态";
            return cell2;
        }
        if (10 == indexPath.row) {
            cell.textField.placeholder = NSLocalizedString(@"聯繫人/職稱/分機", nil);
    }
    
    if (indexPath.row == 14) {
        SupplierViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"SupplierViewCell"];
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;  //取消Cell点击变灰效果、
        return cell3;
    }
    cell.titleLabel.text = self.array[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 14) {
        return 100;
    }
    
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 5) {
//            NSLog(@"go");
//        ScreenView * position = [[ScreenView alloc]initWithFrame:CGRectMake(0, 0, ZP_Width, ZP_height)];
//        //数据
//        [position Position:_postionArray];
//        //返回
//        position.ThirdBlock = ^(NSString *ContStr,NSNumber *code) {
//            NSLog(@"c = %@",ContStr);
////            [indexPath setTitle:NSLocalizedString(ContStr, nil) forState:UIControlStateNormal];
//        };
//        //  显示
//        [position showInView:self.navigationController.view];
        
        SupplierViewCell2 *cell = [tableView cellForRowAtIndexPath:indexPath];
        self.listBoxView = [[NSBundle mainBundle] loadNibNamed:@"ListBoxView" owner:self options:nil].firstObject;
        self.listBoxView.curString = cell.TissueMorphologyLabel.text;
        self.listBoxView.frame = self.view.frame;
        [[UIApplication sharedApplication].keyWindow addSubview:self.listBoxView];
        CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];//获取cell在tableView中的位置
        
        
        CGRect rectInSuperview = [tableView convertRect:rectInTableView toView:[tableView superview]];
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic[@"data"] = @[@"总厂",@"经销商",@"总代理",@"进出口商",@"其他"];
        dic[@"width"] = @150;
        dic[@"higth"] = @400;
        
        [self.listBoxView showTableViewWithDic:dic SuperViewFrame:self.view.frame SenderBtnFrame:rectInSuperview ListBoxBlock:^(id obj) {
            cell.TissueMorphologyLabel.text = obj;
        }];
    }
    
    if (indexPath.row == 14) {
        NSLog(@"tijiao");
        
    }
    
    
}




@end
