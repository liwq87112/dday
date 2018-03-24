//
//  NnestedCollectionViewCell.m
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/29.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import "NnestedCollectionViewCell.h"
#import "PrefixHeader.pch"
#import "ZP_SixthModel.h"
@implementation NnestedCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)cellWithdic:(ZP_SixthModel *)model {
    [self.ImageView sd_setImageWithURL:[NSURL URLWithString:model.defaultimg] placeholderImage:[UIImage imageNamed:@""]];
    self.titleLabel.text = model.productname;
    self.priceLabel.text = [NSString stringWithFormat:@"%@ %@", DD_MonetarySymbol, model.PreferentialLabel];
}

@end
