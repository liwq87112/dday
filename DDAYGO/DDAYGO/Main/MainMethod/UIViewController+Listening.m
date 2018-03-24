//
//  UIViewController+Listening.m
//  DDAYGO
//
//  Created by 小树普惠 on 2018/3/2.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import "UIViewController+Listening.h"
#import "PrefixHeader.pch"
@implementation UIViewController (Listening)

- (void)listening {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(adjustStatusBar:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

// 热点被接入，子类重写
- (void)adjustStatusBar:(NSNotification *)notification {
    NSValue * rectValue = [notification.userInfo objectForKey:UIApplicationStatusBarFrameUserInfoKey];
    CGRect statusRect = [rectValue CGRectValue];
    CGFloat height = statusRect.size.height;
    if (height > 20) {
        appD.window.frame = CGRectMake(0, 0, ZP_Width, ZP_height);
    }else{
        appD.window.frame = CGRectMake(0, 0, ZP_Width, ZP_height);
    }
    
}


@end
