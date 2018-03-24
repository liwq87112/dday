//
//  MerchantCollectionViewCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/22.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantModel.h"
@interface MerchantCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * headerlabel;
@property (nonatomic, strong) UILabel * preferentialLabel;
@property (nonatomic, strong) UILabel * priceLabel;
@property (nonatomic, strong) UILabel * TrademarkLabel;

//- (void)cellWithdic:(NSDictionary *)dic;
- (void)merchant:(MerchantModel *)model;
@end
