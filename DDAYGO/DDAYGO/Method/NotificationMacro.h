//
//  NotificationMacro.h
//  SkinsDemo
//
//  Created by Login on 2017/8/30.
//  Copyright © 2017年 Andy. All rights reserved.
//
//

#ifndef NotificationMacro_h
#define NotificationMacro_h

#define isIos7      ([[[UIDevice currentDevice] systemVersion] floatValue])

#define StatusbarSize ((isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_1)?20.f:0.f)

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

/* { thread } */
#define __async_opt__  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define __async_main__ dispatch_async(dispatch_get_main_queue()


#define kThemeChangedNotification @"ThemeChangedNotification"


#endif /* NotificationMacro_h */
