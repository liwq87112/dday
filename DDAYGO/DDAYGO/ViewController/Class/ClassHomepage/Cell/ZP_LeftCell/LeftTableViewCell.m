//
//  LeftTableViewCell.m
//  DDAYGO
//
//   Created by 小树普惠 on 2017/9/7.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "LeftTableViewCell.h"
#import "ZP_RightModel.h"

@implementation LeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)updateData:(id)data {
    ZP_RightModel * model = data;
    [self.contentBtn setTitle:model.contentLabel forState:UIControlStateNormal];
    [self.contentBtn setTitle:model.contentLabel forState:UIControlStateSelected];
}

- (void)updateSelectState:(BOOL)selected {
    self.selectView.hidden = !selected;
    self.contentBtn.selected = selected;
    if (selected) {
        self.backgroundColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor colorWithRed:235/255. green:235/255. blue:235/255. alpha:1];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
