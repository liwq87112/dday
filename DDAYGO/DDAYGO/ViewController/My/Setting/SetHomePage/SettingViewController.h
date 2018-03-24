//
//  SettingViewController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/22.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromptBoxView.h"
@interface SettingViewController : PromptBoxView
@property (weak, nonatomic) IBOutlet UIScrollView * SettingScrollView;
@property (strong, nonatomic) IBOutlet UIImageView * PhotoImage;
@property (strong, nonatomic) IBOutlet UILabel * AccountNumber;   // 账号
@property (strong, nonatomic) IBOutlet UILabel * nicknameLabel;  // 昵称
@property (strong, nonatomic) IBOutlet UILabel * BindingICUELabel;  // 绑定ICUE
@property (strong, nonatomic) IBOutlet UILabel * bindingEmailLabel;  // 绑定邮箱
@property (strong, nonatomic) IBOutlet UILabel * BindingIntroduce;    // 绑定介绍人

@end
