//
//  MessageViewCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/31.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_InformationModel.h"

@interface ZP_MessageViewCell : UITableViewCell
@property (nonatomic, strong) UILabel * MessageLabel;            // 卖家留言
@property (nonatomic, strong) UITextField * MessagetextField;          //输入框
@property (nonatomic, strong) UILabel * TotalLabel;            // 总计
@property (nonatomic, strong) UILabel * SmallLabel;           // 小计
@property (nonatomic, strong) UILabel * ComputationsLabel;   // 价格

@property (nonatomic, strong) NSString *allMoney;
@property (nonatomic, strong) NSString *allCount;

- (void)MessageDic:(ZP_InformationModel *)model;
@end
