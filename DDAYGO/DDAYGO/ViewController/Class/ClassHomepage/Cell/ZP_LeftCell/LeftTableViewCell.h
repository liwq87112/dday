//
//  LeftTableViewCell.h
//  DDAYGO
//
//   Created by 小树普惠 on 2017/9/7.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_LeftModel.h"
@interface LeftTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *contentBtn;
@property (weak, nonatomic) IBOutlet UIView *selectView;
- (void)updateData:(id)data;
- (void)updateSelectState:(BOOL)selected;
@end
