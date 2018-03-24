//
//  BetViewController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/28.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromptBoxView.h"
@interface BetViewController : PromptBoxView
@property (nonatomic, strong) UILabel * TitleLabel1;  // 标题
@property (nonatomic, strong) UILabel * TimeLabel;  // 时间
@property (nonatomic, strong) UILabel * TitleLabel2; // 标题
@property (nonatomic, strong) UILabel * AmountLabel; // 金额
@property (nonatomic, strong) UILabel * YuanLabel; // 元
@property (weak, nonatomic) IBOutlet UIView *TabbarView; //底部view
@property (weak, nonatomic) IBOutlet UIButton *determineBut;
@property (weak, nonatomic) IBOutlet UIButton *PlaceorderBut; // 下单
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *TableviewLayoutConstraint;

@end
