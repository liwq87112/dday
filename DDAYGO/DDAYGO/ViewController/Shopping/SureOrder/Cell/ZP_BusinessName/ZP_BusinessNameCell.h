//
//  ZP_BusinessNameCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/31.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_InformationModel.h"
@interface ZP_BusinessNameCell : UITableViewCell
@property (nonatomic, strong) UILabel * merchantsLabel;
//@property (nonatomic, strong) ZP_InformationModel * model;
- (void)InformationModel:(ZP_InformationModel *)model;
@end
