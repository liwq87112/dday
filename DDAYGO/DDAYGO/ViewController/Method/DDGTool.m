//
//  DDGTool.m
//  DDAYGO
//
//  Created by 小树普惠 on 2018/2/27.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import "DDGTool.h"
#import "Const.h"
#import "SDImageCache.h"

@implementation DDGTool

+ (void)logout {
    Token = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"symbol"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"countrycode"];
    [NSNotification notificationWithName:@"changeStaus" object:nil];
    
    ZPICUEToken = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"icuetoken"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"state"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"headerImage"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"NameLabel"];
    [[SDImageCache sharedImageCache] clearDisk];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //跳转
    if ([[[UIApplication sharedApplication] keyWindow].rootViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController * tbvc  = [[UIApplication sharedApplication] keyWindow].rootViewController;
        [tbvc setSelectedIndex:0];
    }
}

@end
