//
//  ThemeManager.m
//  DDAYGO
//
//  Created by Login on 2017/9/7.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "ThemeManager.h"

static ThemeManager * sharedThemeManager;

@implementation ThemeManager

+ (ThemeManager *) sharedThemeManager {
    
    
    @synchronized(self) {
        if (nil == sharedThemeManager) {
            sharedThemeManager = [[ThemeManager alloc] init];
        }
    }
    
    return sharedThemeManager;
}


+ (UIImage *)imageNamed:(NSString *)name {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    UIImage *image = nil;
    if ([ThemeManager defaultConfigure].themefold != nil && [ThemeManager defaultConfigure].themefold.length > 0) {
        NSString *path = [[documentsDirectory stringByAppendingPathComponent:[ThemeManager defaultConfigure].themefold] stringByAppendingPathComponent:name];
        image = [UIImage imageWithContentsOfFile:path];
    }
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    
    return image;
}

+ (ThemeManager *)defaultConfigure {
    static ThemeManager *configureObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        configureObj = [[ThemeManager alloc] init];
    });
    
    return configureObj;
}

@end
