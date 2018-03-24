//
//  ShopIntroductionViewController.m
//  DDAYGO
//
//  Created by Login on 2017/9/19.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "ShopIntroductionViewController.h"
#import "ShoplntroductionCell.h"
#import "PrefixHeader.pch"
@interface ShopIntroductionViewController () <UITableViewDelegate,UITableViewDataSource> {
    
    NSArray * dataArray;
}
@property (nonatomic, strong) UITableView * tableview;

@end

@implementation ShopIntroductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"店铺介绍", nil);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:ZP_textWite}];   // 更改导航栏字体颜色
    [self initUI];
    dataArray = @[@{@"Storename":@"金太阳国际",@"Address":@"台湾高雄市",@"Phone":@"+86 15118041624",@"rating":@"100%",@"Servicetime":@"星期一 - 星期六 AM10:00 - FM09:00",@"BusinessregistrationID":@"12706283MFZS1120996"}];
    
}

- (void)initUI {
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ZP_Width, ZP_height)style:UITableViewStylePlain];
    self.tableview.backgroundColor = ZP_Graybackground;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    [self.tableview registerClass:[ShoplntroductionCell class] forCellReuseIdentifier:@"Shoplntroduction"];
}

#pragma Makr - TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ShoplntroductionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Shoplntroduction"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone; // 取消Cell变灰效果
    self.tableview.tableFooterView = [[UIView alloc]init];
    NSDictionary * dic = dataArray[indexPath.row];
    [cell ShoplntroductionDic:dic];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return 160;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
