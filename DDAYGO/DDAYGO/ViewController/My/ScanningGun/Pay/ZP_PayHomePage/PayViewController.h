//
//  PayViewController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/10.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView * tableView;
@property (nonatomic, strong) NSString * Oid;
@property (nonatomic, strong) NSString * Oname;
@property (nonatomic, strong) UILabel * PriceLabel; //  总金额


@end
