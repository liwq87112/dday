//
//  Pop-upMenuSingleton.m
//  DDAYGO
//
//  Created by Login on 2017/9/19.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "Pop-upMenuSingleton.h"
#import "Pop-upPrefixHeader.pch"

@interface Pop_upMenuSingleton ()
@property (nonatomic, strong) Pop_upMenuView * popMenuView;

@end

@implementation Pop_upMenuSingleton

+ (Pop_upMenuSingleton *)shareManager {
    
    static Pop_upMenuSingleton *_PopMenuSingleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _PopMenuSingleton = [[Pop_upMenuSingleton alloc]init];
    });
    return _PopMenuSingleton;
    
}

- (void) showPopMenuSelecteWithFrame:(CGFloat)width
                                item:(NSArray *)item
                              action:(void (^)(NSInteger))action {
    __weak __typeof(&*self)weakSelf = self;
    if (self.popMenuView != nil) {
        [weakSelf hideMenu];
    }
    UIWindow * window = [[[UIApplication sharedApplication] windows] firstObject];
    self.popMenuView = [[Pop_upMenuView alloc]initWithFrame:window.bounds
                                                  menuWidth:width
                                                      items:item
                                                     action:^(NSInteger index) {
                                                         action(index);
                                                         [weakSelf hideMenu];
                                                     }];
    self.popMenuView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
    [window addSubview:self.popMenuView];
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.popMenuView.tableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    
    
}

- (void) hideMenu {
    [UIView animateWithDuration:0.15 animations:^{
        self.popMenuView.tableView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
    } completion:^(BOOL finished) {
        [self.popMenuView.tableView removeFromSuperview];
        [self.popMenuView removeFromSuperview];
        self.popMenuView.tableView = nil;
        self.popMenuView = nil;
    }];
}

@end
