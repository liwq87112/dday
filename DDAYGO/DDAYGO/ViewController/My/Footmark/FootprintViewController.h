//
//  FootprintViewController.h
//  DDAYGO
//
//   Created by 小树普惠 on 2017/9/7.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromptBoxView.h"
@interface FootprintViewController : PromptBoxView
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UILabel * RemindLabel;

@end
