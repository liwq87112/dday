//
//  Supplier1ViewController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/29.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromptBoxView.h"
@interface Supplier1ViewController : PromptBoxView
@property (weak, nonatomic) IBOutlet UITableView * tableView;
@property (weak, nonatomic) IBOutlet UIView *noStoreView;
@property (weak, nonatomic) IBOutlet UIButton *sendingBtn;
@property (assign, nonatomic) NSInteger stausType;
@property (weak, nonatomic) IBOutlet UILabel * TExtLabel; // 状态Label
@property (nonatomic, strong) NSString * reason;

@property (weak, nonatomic) IBOutlet UILabel * LocationLabel; // 地区Label


@end
