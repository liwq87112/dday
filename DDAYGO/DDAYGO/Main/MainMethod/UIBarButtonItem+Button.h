//
//  UIBarButtonItem+Button.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/28.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Button)
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image higlImage:(UIImage *)highImage target:target action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:target action:(SEL)action;

+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:target action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title  target:target action:(SEL)action;

@end

