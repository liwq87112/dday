//
//  ZPSearchBarBUtton.m
//  DDAYGO
//
//  Created by Login on 2017/9/8.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "ZPSearchBarBUtton.h"
#import "UIView+Extension.h"
@implementation ZPSearchBarBUtton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = 40;
    CGFloat imageH = self.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = 30;
    CGFloat titleY = 0;
    CGFloat titleW = self.width - 40;
    CGFloat titleH = self.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
@end
