//
//  HomePageViewController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/16.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLButton.h"
#import "UIButton+Layout.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface HomePageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView * tableView;

@end
