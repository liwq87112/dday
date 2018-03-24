//
//  BGCenterLineLabel.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/14.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "BGCenterLineLabel.h"

@implementation BGCenterLineLabel

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];    
    UIRectFill(CGRectMake(0, rect.size.height * 0.5, rect.size.width, 1));
}

@end
