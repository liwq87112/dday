//
//  tableHeadView1.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/28.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_BetHeaderModel.h"
@interface tableHeadView1 : UIView
@property (weak, nonatomic) IBOutlet UILabel *YearsLabel; // 期数(年)
@property (weak, nonatomic) IBOutlet UILabel *MonthLabel; // 期数（月）
@property (weak, nonatomic) IBOutlet UILabel *DyaLabel; // 期数（日）
@property (weak, nonatomic) IBOutlet UILabel *ItmeLanel; // 时间
@property (weak, nonatomic) IBOutlet UILabel *AmountLabel; // 奖池金额
@property (weak, nonatomic) IBOutlet UILabel *NumberLabel; // 彩金劵数
@property (weak, nonatomic) IBOutlet UILabel *BallLabel;  // 已选的球

- (void)tableHeadView1:(ZP_BetHeaderModel *)model;


@end
