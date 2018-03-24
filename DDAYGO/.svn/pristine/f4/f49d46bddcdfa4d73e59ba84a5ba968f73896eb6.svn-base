//
//  UIButton+UIButtonImageWithLable.m
//  HibyMusic
//
//  Created by sanj on 16/8/10.
//  Copyright © 2016年 hibymusic. All rights reserved.
//

#import "UIButton+UIButtonImageWithLable.h"
#import "NSString+Additions.h"

@implementation UIButton (UIButtonImageWithLable)

- (void)resizeWithDistance:(int)distance offset:(CGFloat)offset{
    if (distance % 2) {
        distance ++;
    }
    [self.imageView setContentMode:UIViewContentModeCenter];
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    NSString *title = [self titleForState:UIControlStateNormal];
    UIImage *image = [self imageForState:UIControlStateNormal];
    CGSize titleSize = [title sizeWithFont:self.titleLabel.font forWidth:0];
    float y = titleSize.height + distance / 4.0f;
    UIEdgeInsets titleInset = UIEdgeInsetsMake(distance / 2.0f - y + offset, -image.size.width, -(image.size.height + titleSize.height), 0.0);
    UIEdgeInsets imageInset = UIEdgeInsetsMake(-distance / 2.0f - y + offset, floorf((self.frame.size.width - image.size.width) / 2.0f), 0, floorf((self.frame.size.width - image.size.width) / 2.0f));
    [self setTitleEdgeInsets:titleInset];
    [self setImageEdgeInsets:imageInset];
}

- (void)resizeWithDistance:(int)distance
{
    [self resizeWithDistance:distance offset:0];
}

@end
