//
//  SatisfactionSurveyController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/19.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SatisfactionSurveyController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSNumber * sid; // 供货商ID
@end
