//
//  OrderSearchView.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/28.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "OrderSearchView.h"

@implementation OrderSearchView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.hidden = YES;
}

- (void)show {
    self.hidden = NO;
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [UIView animateWithDuration:0.3f animations:^{
        self.frame = [UIScreen mainScreen].bounds;
    } completion:^(BOOL finished) {
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.3f animations:^{
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
    [_searchtextField resignFirstResponder];
}

@end
