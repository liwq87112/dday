//
//  ZP_DetailsSistoryAwardController.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/1.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "ZP_DetailsSistoryAwardController.h"
#import "ZP_DetailsSistoryAwardTableViewCell.h"
#import "PrefixHeader.pch"
#import "ZP_MyTool.h"
#import "ZP_LotterModel.h"
@interface ZP_DetailsSistoryAwardController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong ,nonatomic) NSDictionary *prizeDic;
@property (strong ,nonatomic) NSArray *dataArray;
@property (strong ,nonatomic) ZP_LotterModel * model;
@end

@implementation ZP_DetailsSistoryAwardController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:ZP_WhiteColor}];   // 更改导航栏字体颜色
    [self.navigationController.navigationBar lt_setBackgroundColor:ZP_NavigationCorlor];  //  更改导航栏颜色
    self.bountyLabel.text = MyLocal(@"bount");
    self.promptLabel.text = MyLocal(@"promptLabelText");
    self.winningNumbLabel2.text = MyLocal(@"winningNumbLabel2");
    self.winningNumbLabel3.text = MyLocal(@"winningNumbLabel3");
    self.winningNumbLabel4.text = MyLocal(@"winningNumbLabel4");
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(adjustStatusBar:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

- (void)initUI {
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;  //隐藏tableview多余的线条
    [self.tableview registerNib:[UINib nibWithNibName:@"ZP_DetailsSistoryAwardTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZP_DetailsSistoryAwardTableViewCell"];
    [self getData];
}

- (void)getData {
    [ZP_MyTool requestLotterypoolwininfo:@{@"token":DD_TOKEN,@"pollid":_pollid} uccess:^(id obj) {
        ZPLog(@"%@",obj);
        ZP_LotterModel * model = [ZP_LotterModel mj_objectWithKeyValues:obj];
        self.model = model;
        self.prizeDic = obj;
        _AmountLabel.text = [model.lbalance stringValue];
        [self updateData:model];
        if ([obj[@"result"]isEqualToString:@"token_not_exist"]) {
            //        清除所有的数据
            Token = nil;
            DDAYGO_REMOVE_TOKEN; DDAYGO_REMOVE_SYMBOL; DDAYGO_REMOVE_COUNTRYCODE; DDAYGO_REMOVE_ICUETOKEN; DDAYGO_REMOVE_STATE; DDAYGO_REMOVE_HEADERIMAGE; DDAYGO_REMOVE_NAMELABEL; DD_ChangeStaus;
            ZPICUEToken = nil;
            [[SDImageCache sharedImageCache] clearDisk];
#pragma make -- 提示框
            [self logouttt];
        }
    } failure:^(NSError *error) {
        
    }];
}

- (void)updateData:(ZP_LotterModel *)model {
    lotteryModel *model1 = [lotteryModel mj_objectWithKeyValues:model.lottery];
    _NperLabel.text = self.title;
    _DatesLabel.text = model1.recordtime;
    //    [_button1 setTitle:[model1.white1 stringValue] forState:UIControlStateNormal];
    //    [_button2 setTitle:[model1.white2 stringValue] forState:UIControlStateNormal];
    //    [_button3 setTitle:[model1.white3 stringValue] forState:UIControlStateNormal];
    //    [_button4 setTitle:[model1.white4 stringValue] forState:UIControlStateNormal];
    //    [_button5 setTitle:[model1.white5 stringValue] forState:UIControlStateNormal];
    //    [_button6 setTitle:[model1.powerball stringValue] forState:UIControlStateNormal];
    //    NSLog(@"dic %@",model.lottery);
    
    //下面一个数据 直接用
    lotteryModel *model2 = [lotteryModel mj_objectWithKeyValues:model.lottery];
    //        _AmountLabel.text = [model2.poolamount stringValue];
    NSLog(@"m2 %@",model2.createtime);
    // lottoerwinmodel 的数据
    NSArray *arr = [lotterywinModel mj_objectArrayWithKeyValuesArray:model.lotterywin];
    
    //如你想取第一个的数据
    lotterywinModel * model3 = arr[0]; //这个是头奖的后面
    _currentPeriodLabel1.text = [model3.winamount stringValue];
    _currentPeriodLabel2.text = [model3.wincount stringValue];
    _currentPeriodLabel3.text = [model3.winunit stringValue];
    _currentPeriodLabel4.text = [model3.winunit stringValue];
    _currentPeriodLabel5.text = [model3.winunit stringValue];
    //    NSLog(@"m3 = %@",model3.state);
    //以此类推
    lotterywinModel *model4 = arr[1]; //这个是头奖的后面
    _winnersNumLabel1.text = [model4.winamount stringValue];
    _winnersNumLabel2.text = [model4.wincount stringValue];
    _winnersNumLabel3.text = [model4.winunit stringValue];
    _winnersNumLabel4.text = [model4.winunit stringValue];
    _winnersNumLabel5.text = [model4.winunit stringValue];
    
    lotterywinModel *model5 = arr[2]; //这个是头奖的后面
    _bountyLabel1.text = [model5.winamount stringValue];
    _bountyLabel2.text = [model5.wincount stringValue];
    _bountyLabel3.text = [model5.winunit stringValue];
    _bountyLabel4.text = [model5.winunit stringValue];
    _bountyLabel5.text = [model5.winunit stringValue];
    
    lotteryorderModel * model6 = [lotteryorderModel mj_objectWithKeyValues:model.lotteryorder.firstObject];
    
    if (model2) {
        _button1.hidden = NO;
        _button2.hidden = NO;
        _button3.hidden = NO;
        _button4.hidden = NO;
        _button5.hidden = NO;
        _button6.hidden = NO;
        
        //        _OrderNumberLabel.text = [model6.lotteryoid stringValue];
        [_button1 setTitle:[NSString stringWithFormat:@"%02d",model2.white1.intValue] forState:UIControlStateNormal];
        [_button2 setTitle:[NSString stringWithFormat:@"%02d",model2.white2.intValue] forState:UIControlStateNormal];
        [_button3 setTitle:[NSString stringWithFormat:@"%02d",model2.white3.intValue] forState:UIControlStateNormal];
        [_button4 setTitle:[NSString stringWithFormat:@"%02d",model2.white4.intValue] forState:UIControlStateNormal];
        [_button5 setTitle:[NSString stringWithFormat:@"%02d",model2.white5.intValue] forState:UIControlStateNormal];
        [_button6 setTitle:[NSString stringWithFormat:@"%02d",model2.powerball.intValue] forState:UIControlStateNormal];
    } else {
        _button1.hidden = YES;
        _button2.hidden = YES;
        _button3.hidden = YES;
        _button4.hidden = YES;
        _button5.hidden = YES;
        _button6.hidden = YES;
        
        _OrderNumberLabel.text = nil;
    }
    [self updateBounctyViewWithBonus:[self.prizeDic[@"lottery"][@"poolamount"] integerValue] Suffix:@""];
    [self.tableview reloadData];
}

- (void)updateBounctyViewWithBonus:(NSInteger)bonus Suffix:(NSString *)suffix {
    for (UIView *view in self.bounctyView.subviews) {
        [view removeFromSuperview];
    }
    NSString *bonusString = @(bonus).stringValue;
    NSInteger commaCount = (bonusString.length - 1) / 3;
    CGFloat startPoint = ([UIScreen mainScreen].bounds.size.width - (14 * (bonusString.length + 1) + (bonusString.length + commaCount) * 3 + commaCount * 10)) / 2;
    for (int i = 0; i < bonusString.length; i ++) {
        UIButton *bonusBtn = [[UIButton alloc] initWithFrame:CGRectMake(startPoint, 0, 14, 20)];
        [bonusBtn setBackgroundImage:[UIImage imageNamed:@"bg_lottery_money"] forState:UIControlStateNormal];
        [bonusBtn setTitle:[bonusString substringWithRange:NSMakeRange(i, 1)] forState:UIControlStateNormal];
        [bonusBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
        if (0 == (bonusString.length - i) % 3 && i > 0) {
            UIButton *commaBtn = [[UIButton alloc] initWithFrame:CGRectMake(startPoint, 0, 10, 20)];
            [commaBtn setTitle:@"," forState:UIControlStateNormal];
            [commaBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [bonusBtn setFrame:CGRectMake(startPoint + 13, 0, 14, 20)];
            [self.bounctyView addSubview:commaBtn];
            [self.bounctyView addSubview:bonusBtn];
            
            startPoint += 32;
        } else {
            [self.bounctyView addSubview:bonusBtn];
            
            startPoint += 17;
        }
    }
    
    UIButton *suffixBtn = [[UIButton alloc] initWithFrame:CGRectMake(startPoint, 0, 14, 20)];
    [suffixBtn setTitle:suffix forState:UIControlStateNormal];
    [suffixBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.bounctyView addSubview:suffixBtn];
}

#pragma mark -- tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.model.lotteryorder.count == 0) {
        self.promptLabel.hidden = NO;
        return self.model.lotteryorder.count;
    }else {
        self.promptLabel.hidden = YES;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZP_DetailsSistoryAwardTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZP_DetailsSistoryAwardTableViewCell"];
    [cell HistoryBet:self.model.lotteryorder[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZPLog(@"%ld",indexPath.row);
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
