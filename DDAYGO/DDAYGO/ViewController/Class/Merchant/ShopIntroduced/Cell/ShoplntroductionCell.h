//
//  ShoplntroductionCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/9.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoplntroducedModel.h"
@interface ShoplntroductionCell : UITableViewCell
@property (nonatomic, strong) UILabel *  StorenameLabel; // 店铺名字
@property (nonatomic, strong) UILabel *  AddressLabel; // 地址
@property (nonatomic, strong) UILabel * PhoneLabel; // 电话号码
@property (nonatomic, strong) UILabel * ratingLabel; // 评价
@property (nonatomic, strong) UILabel * ServicetimeLabel; // 服务时间
@property (nonatomic, strong) UILabel * BusinessregistrationIDLabel; // 营业登记
@property (nonatomic, strong) UIImageView * phoneimageView; // 電話圖標
- (void)ShoplntroducedCollection:(NSDictionary *)dic andDic:(NSDictionary *)dict;
@end
