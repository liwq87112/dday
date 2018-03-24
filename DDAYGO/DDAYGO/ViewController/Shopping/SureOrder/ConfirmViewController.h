//
//  ConfirmViewController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/20.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_ShoppingModel.h"

#include "PromptBoxView.h"
@interface ConfirmViewController : PromptBoxView

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger shopNum;
@property (nonatomic, strong) NSString * shopMoney;
@property (nonatomic, strong) NSNumber * stockid;
@property (nonatomic, strong) NSString * shopname;
@property (nonatomic, strong) UIView * bottomView;
@property (nonatomic, strong) UILabel * StatisticsLabel; //  合计
@property (nonatomic, strong) UILabel * PriceLabel; //  总金额
@property (nonatomic, strong) UILabel * CurrencySymbolLabel; //货币符号
@property (nonatomic, strong) UIButton * ClearingBut;//  提交订单
@property (nonatomic, strong) UILabel * HintLanguageLabel; //  提示语
@property (nonatomic, copy) NSString * stockidsString;//  库存id字串
/** Web*/
@property (nonatomic, copy) NSString * jump_HeadURL;
@property (nonatomic, copy) NSString * jump_URL;

/**购物车*/
@property (nonatomic, strong) NSArray * dataArray;
@property (nonatomic, strong) NSArray * nameArray;
@property (nonatomic, strong) ZP_ShoppingModel * model;
@property (nonatomic, strong) NSString * PriceStr;
@property (nonatomic, strong) NSString * NumStr;
@property (nonatomic, assign) BOOL noEdit;
@property (nonatomic, strong) NSNumber * ordersnumber;

@end

