//
//  PromptBoxView.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/3/9.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromptBoxView : UIViewController

@property (strong, nonatomic) UIAlertAction *okAction;
@property (strong, nonatomic) UIAlertAction *cancelAction;

- (void)logouttt;
- (void)DeleteData;
- (void)Jump;
@end
