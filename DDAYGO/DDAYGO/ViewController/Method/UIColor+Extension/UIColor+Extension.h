//
//  UIColor+Extension.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/8.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
+ (UIColor*) colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *) colorWithHexString: (NSString *)color;
+ (NSString *) hexFromUIColor: (UIColor*) color;
@end
