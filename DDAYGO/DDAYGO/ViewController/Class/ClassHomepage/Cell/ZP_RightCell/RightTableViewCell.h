//
//  RightTableViewCell.h
//  DDAYGO
//
//   Created by 小树普惠 on 2017/9/7.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_RightModel.h"
@interface RightTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel * contentLabel;

- (void)updateData:(ZP_RightModel *)model;
@end
