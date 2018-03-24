//
//  NnestedCollectionViewCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/29.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_SixthModel.h"
@interface NnestedCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView * ImageView;
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@property (weak, nonatomic) IBOutlet UILabel * priceLabel;
//@property (weak, nonatomic) IBOutlet UILabel * TrademarkLabel;

- (void)cellWithdic:(ZP_SixthModel *)dic;
@end
