//
//  ReuseCollectionViewCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/13.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_FifthModel.h"

@interface ReuseCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView * imageView; // 主图
@property (nonatomic, strong) UILabel * titleLabel;  // 标题
@property (nonatomic, strong) UILabel * PreferentialLabel; // 优惠价格
@property (nonatomic, strong) UIImageView * TrademarkImage; //商标
@property (nonatomic, strong) UILabel * TrademarkLabel; // 商标编号

- (void)cellWithdic:(ZP_FifthModel *)model;
@end
