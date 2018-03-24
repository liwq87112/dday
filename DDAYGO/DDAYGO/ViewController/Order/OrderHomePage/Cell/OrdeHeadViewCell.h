//
//  OrdeHeadViewCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/28.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_OrderModel.h"
@interface OrdeHeadViewCell : UITableViewCell
@property (nonatomic ,strong) UILabel * OrderLabel;            //  订单Name
@property (nonatomic, strong) UILabel * IDLabel;              //  ID号
@property (nonatomic, strong) UILabel * DateLabel;           //  日期
@property (nonatomic, strong) UILabel * TradingLabel;      //  交易状态
@property (nonatomic, strong) UIButton * DeleteBut;       // 删除按钮
- (void)InformationWithDic:(OrdersdetailModel *)dic WithModel:(OrderModel *)model;
@end
