//
//  UIFont+Extension.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/8.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)
+ (instancetype)myFontOfSize:(CGFloat)size {
    UIFont * font = [UIFont systemFontOfSize:size];
    return font;
}

@end
