//
//  ZP_LotteryHistoricalBettingNumberController.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/18.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "ZP_LotteryHistoricalBettingNumberController.h"
#import "ZP_LotteryHistoricalBettingNumberCell.h"
#import "ZP_LotteryHistoricalBettingNumberModel.h"
#import "ZP_MyTool.h"
#import "PrefixHeader.pch"

@interface ZP_LotteryHistoricalBettingNumberController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)  UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * secData;
@property (nonatomic, strong) NSMutableArray * rowData;
@property (nonatomic, strong) NSMutableDictionary * allData;
@property (nonatomic, strong) NoDataView * NoDataView;

@end


@implementation ZP_LotteryHistoricalBettingNumberController

- (NSMutableArray *)secData {
    if (!_secData) {
        _secData = [NSMutableArray array];
    }
    return _secData;
}

- (NSMutableArray *)rowData {
    if (!_rowData) {
        _rowData = [NSMutableArray array];
    }
    return _rowData;
}

- (NSMutableDictionary *)allData {
    if (!_allData) {
        _allData = [NSMutableDictionary dictionary];
    }
    return _allData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableHeadView];
    [self initUI];
    [self AllData];
    self.NoDataView.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(adjustStatusBar:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate= self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

//  UI
- (void)initUI {
    self.title = NSLocalizedString(@"History submission number", nil);
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZP_LotteryHistoricalBettingNumberCell" bundle:nil] forCellReuseIdentifier:@"ZP_LotteryHistoricalBettingNumberCell"];
    //    [self.tableView registerClass:[ZP_LotterySubCell class] forCellReuseIdentifier:@"lotterysubcell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;  //隐藏tableview多余的线条
    
    /**** IOS 11 ****/
    if (@available(iOS 11.0, *)) {
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
    
    [NoDataView initWithSuperView:self.view Content:nil FinishBlock:^(id response) {
        self.NoDataView = response;
        [self.tableView reloadData];
    }];
}

- (void)initTableHeadView {
    UIView * myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ZP_Width, 30)];
    [myView setBackgroundColor:ZP_Graybackground];
    myView.hidden = YES;
    ZP_GeneralLabel * TitleLabel1 = [ZP_GeneralLabel initWithtextLabel:_TitleLabel1.text textColor:ZP_textblack font:ZP_stockFont textAlignment:NSTextAlignmentLeft bakcgroundColor:ZP_Graybackground];
    [myView addSubview:TitleLabel1];
    _TitleLabel1 = TitleLabel1;
    [TitleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(myView).offset(8);
        make.centerY.equalTo(myView);
        make.height.mas_equalTo(15);
    }];
    
    //     标题2
    ZP_GeneralLabel * TitleLabel2 = [ZP_GeneralLabel initWithtextLabel:_TitleLabel2.text textColor:ZP_textblack font:ZP_stockFont textAlignment:NSTextAlignmentLeft bakcgroundColor:ZP_Graybackground];
    [myView addSubview:TitleLabel2];
    _TitleLabel2 = TitleLabel2;
    [TitleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(TitleLabel1).offset(15);
        make.top.equalTo(TitleLabel1).offset(0);
        make.height.mas_equalTo(15);
    }];
    
    //    标题3
    ZP_GeneralLabel * titleLabel3 = [ZP_GeneralLabel initWithtextLabel:_TitleLabel3.text textColor:ZP_textblack font:ZP_TrademarkFont textAlignment:NSTextAlignmentLeft bakcgroundColor:ZP_Graybackground];
    [myView addSubview:titleLabel3];
    _TitleLabel3 = titleLabel3;
    [titleLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(TitleLabel2).offset(65);
        make.top.equalTo(TitleLabel2).offset(0);
        make.height.mas_offset(15);
    }];
    self.tableView.tableHeaderView = myView;
    
}

// 数据
- (void)AllData {
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"countrycode"] = CountCode;
    dic[@"token"] = Token;
    dic[@"page"] = @"1";
    dic[@"pagesize"] = @"6";
    [ZP_MyTool requestHistoricalBet:dic uccess:^(id obj) {
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
        ZPLog(@"%@",obj);
        if ([obj isKindOfClass:[NSDictionary class]]) {
            
            return ;
        }
        ZP_LotteryHistoricalBettingNumberModel *model1 = [ZP_LotteryHistoricalBettingNumberModel mj_objectWithKeyValues:obj[0]];
        [self.secData addObject:model1];
        [self settitltHade:model1];
        self.rowData= [ZP_LotteryHistoricalBettingNumberModel2 mj_objectArrayWithKeyValuesArray:model1.winorders];
        [self.tableView reloadData];
    } failure:^(NSError * error) {
        ZPLog(@"%@",error);
    }];
    
}

// 获取最外层年月日时间
- (void)settitltHade:(ZP_LotteryHistoricalBettingNumberModel *)model {
    self.TitleLabel1.text = [NSString stringWithFormat:@"第%@%@%@期",model.yyyy,model.mm,model.periods]; // 数据多个拼接
    self.TitleLabel3.text = [NSString stringWithFormat:@"%@",model.createtime];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    if (self.rowData.count > 0) {
        self.tableView.hidden = NO;
        self.NoDataView.hidden = YES;
        return self.rowData.count;
    }else {
        if (self.NoDataView) {
            self.tableView.hidden = YES;
            self.NoDataView.hidden = NO;
        }
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //    return CGFLOAT_MIN;
    if (section == 0) {
        return 0;
    }else {
        return 10.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
    return 0.001;
    
}

///*设置标题头的宽度*/
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//
//    return 25;
//}

/*设置cell 的宽度 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
    
}

#pragma mark -- tableviewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZP_LotteryHistoricalBettingNumberModel2 *model2  = self.rowData[indexPath.section];
    ZP_LotteryHistoricalBettingNumberCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZP_LotteryHistoricalBettingNumberCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;  //取消Cell点击变灰效果
    ZP_LotteryHistoricalBettingNumberModel3 * model3= [ZP_LotteryHistoricalBettingNumberModel3 mj_objectWithKeyValues:model2.winordersdetail[0]];
    [cell fillIntoData:model3];
    
    return cell;
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
