//
//  UITabBarItem+Theme.m
//  DDAYGO
//
//  Created by Login on 2017/9/7.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "UITabBarItem+Theme.h"
#import "ThemeManager.h"
#import "MainViewController.h"
@implementation UITabBarItem (Theme)

+ (UITabBarItem *)ImageName:(NSString *)ImageName selectedImage:(NSString *)selectedImage {
    
    UITabBarItem * homeTabBarItem = [[UITabBarItem alloc]init];
    [homeTabBarItem setImage:[[ThemeManager imageNamed:ImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [homeTabBarItem setSelectedImage:[[ThemeManager imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    return homeTabBarItem;
}
@end
