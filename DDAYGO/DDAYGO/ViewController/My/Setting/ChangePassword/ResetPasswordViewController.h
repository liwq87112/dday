//
//  ResetPasswordViewController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/22.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPasswordViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView * ResetPasswordscrollView;
@property (weak, nonatomic) IBOutlet UITextField * oldpwTextfield; // 原有密码
@property (weak, nonatomic) IBOutlet UITextField * newpwTextfield; // 新密码
@property (weak, nonatomic) IBOutlet UITextField * againpwTextfield; // 确认新密码
@property (weak, nonatomic) IBOutlet UIButton * DetermineBut;// 确定按钮

@end
