//
//  AddressTableViewCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/22.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_FrontPageReceivingAddressModel.h"
@interface AddressTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel * NameLabel; // 姓名
@property (strong, nonatomic) IBOutlet UILabel * PhoneLabel; // 电话
@property (strong, nonatomic) IBOutlet UILabel * AddressLabel; // 地址
@property (weak, nonatomic) IBOutlet UIButton * defBtn; // 设置默认地址
@property (weak, nonatomic) IBOutlet UIButton * DeletingBut; // 删除按钮
@property (nonatomic, strong) NSString * oid;
typedef void (^FinishBlock)(id response);
@property (nonatomic , copy) FinishBlock finishBlock;
- (void)cellWithdic:(ZP_FrontPageReceivingAddressModel *)model;
@end

