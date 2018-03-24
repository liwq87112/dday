//
//  SixthViewCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/13.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SixthViewCell : UITableViewCell
@property (nonatomic, strong) UIButton * moreBut;
@property (nonatomic, strong) NSMutableArray * ArrData;
@property (nonatomic, copy) void(^ThirdBlock)(NSInteger tag);
@end
