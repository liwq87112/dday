//
//  AddressViewController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/22.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_FrontPageReceivingAddressModel.h"
#import "PromptBoxView.h"
@interface AddressViewController : PromptBoxView
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSNumber * oid; // 地址id
@property (nonatomic, copy) void(^popBlock)(ZP_FrontPageReceivingAddressModel * model);
@end
