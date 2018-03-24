//
//  EvaluateTableViewCell.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/11.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "EvaluateTableViewCell.h"
#import "PrefixHeader.pch"
#import "EvaluateModel.h"
@implementation EvaluateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.commodityArray = @[self.commodityBtn1,self.commodityBtn2,self.commodityBtn3,self.commodityBtn4,self.commodityBtn5];
//    self.logisticsArray = @[self.logisticsBtn1,self.logisticsBtn2,self.logisticsBtn3,self.logisticsBtn4,self.logisticsBtn5];
}

- (void)Evaluatemodel:(EvaluateModel *)model {
    NSString * asd = ImgAPI;
    [self.AvatarImageView sd_setImageWithURL:[NSURL URLWithString:[asd stringByAppendingString:model.avatar]]placeholderImage:[UIImage imageNamed:@""]];
    self.usernameLabel.text = model.realname;
    self.timeLabel.text = model.createtime;
    self.commodityLabel.text = model.reviewscontent;
    [self updateStartsWithtype:0 StartCount:[model.fraction integerValue]];
}

- (void)updateStartsWithtype:(NSInteger)startType StartCount:(NSInteger)startCount {
    if (startType == 0) {
        for (int i = 0; i < self.commodityArray.count; i ++) {
            UIButton *button = self.commodityArray[i];
            if (i < startCount) {
                button.selected = YES;
            } else {
                button.selected = NO;
            }
        }
    } else {
        for (int i = 0; i < self.logisticsArray.count; i ++) {
            UIButton *button = self.logisticsArray[i];
            if (i < startCount) {
                button.selected = YES;
            } else {
                button.selected = NO;
            }
        }
    }
}

@end
