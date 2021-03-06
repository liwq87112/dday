//
//  ConfirmViewCell.h
//  
//
//  Created by 小树普惠 on 2017/9/20.
//
//

#import <UIKit/UIKit.h>
#import "ZP_ComfirmModel.h"
@interface ZP_ConfirmViewCell : UITableViewCell

@property (nonatomic, strong) UILabel * ConsigneeLabel;                // 收货人
@property (nonatomic, strong) UILabel * NameLabel;                    // 名字
@property (nonatomic, strong) UILabel * PhotoLabel;                  // 手机号码
@property (nonatomic, strong) UIImageView * addressImage;           // 定位图标
@property (nonatomic, strong) UILabel * AddressLabel;              // 收货地址
@property (nonatomic, strong) UIImageView * ArrowImage;           // 箭头
@property (nonatomic, strong) UILabel * AddressdetailsLabel;     // 地址
@property (nonatomic, strong) UIImageView * CrossImage;         // 横线彩条

- (void)cellWithDic:(ZP_ComfirmModel *)model;

@end
