//
//  ClassificationViewController.h
//  DDAYGO
//
//
//  Created by 小树普惠 on 2017/9/7.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassificationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView * leftTableView;
@property (weak, nonatomic) IBOutlet UITableView * rightTableView;

- (void)getRightItemDataWithProducttypeid:(NSInteger)producttypeid;

@end
