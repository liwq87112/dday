//
//  BetTableViewMyCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/28.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BetTableViewMyCell : UITableViewCell


@property (nonatomic, strong) NSMutableArray *butArray;

@property (nonatomic, copy) void(^arrayBlock)(NSMutableArray *arr);


- (void)upDataButtonWith:(NSInteger )count;

@end
