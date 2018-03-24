//
//  ZP_GeneralLabel.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/20.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "ZP_GeneralLabel.h"
#import "PrefixHeader.pch"
@implementation ZP_GeneralLabel

+ (instancetype)initWithtextLabel:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment bakcgroundColor:(UIColor *)bgColor {
    ZP_GeneralLabel * ZP_Generallbale = [[ZP_GeneralLabel alloc]init];
    ZP_Generallbale.text = text;
    ZP_Generallbale.textColor = textColor;
    ZP_Generallbale.font = font;
    ZP_Generallbale.textAlignment = textAlignment;
//    if (bgColor) {
        ZP_Generallbale.backgroundColor = bgColor;
//    }else {
//        ZP_Generallbale.backgroundColor = ZP_Graybackground;
//    }
    return ZP_Generallbale;
}

@end
