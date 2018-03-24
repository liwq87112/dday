//
//  CollectionViewController.h
//  DDAYGO
//
//   Created by 小树普惠 on 2017/9/7.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "collectionModel.h"
#import "PromptBoxView.h"
@interface CollectionViewController : PromptBoxView
@property (weak, nonatomic) IBOutlet UITableView * tableView;
@property (nonatomic, strong) collectionModel * model;
@end
