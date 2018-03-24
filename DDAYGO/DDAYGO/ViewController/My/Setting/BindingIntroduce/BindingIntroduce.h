//
//  BindingIntroduce.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/27.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromptBoxView.h"
@interface BindingIntroduce : PromptBoxView
@property (strong, nonatomic) IBOutlet UIScrollView * BindingIntroducscrollView;
@property (strong, nonatomic) IBOutlet UITextField * BindingIntroduceTextField;
@property (weak, nonatomic) IBOutlet UIButton * BinDingBut;

@end
