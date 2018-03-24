//
//  ThemeManager.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/7.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ThemeManager : NSObject

@property (nonatomic, copy) NSString * themeNage;  //主题名字
@property (nonatomic, retain) NSString * themefold;


+ (ThemeManager *) sharedThemeManager;

+ (UIImage *)imageNamed:(NSString *)name;

+ (ThemeManager *)defaultConfigure;

@end
