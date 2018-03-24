//
//  ExpressDeliveryCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/31.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_ExpressDeliveryModel.h"
@interface ZP_ExpressDeliveryCell : UITableViewCell
@property (nonatomic, strong) UILabel * DistributionLabel;  //  配送方式
@property (nonatomic, strong) UILabel * CourierLabel;      //  快速
@property (nonatomic, strong) UILabel * CostLabel;        //  费用

- (void)ExpressDevliveryDic:(ZP_ExpressDeliveryModel *)model;
@end
