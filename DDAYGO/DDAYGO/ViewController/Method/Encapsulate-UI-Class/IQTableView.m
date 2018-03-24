//
//  IQTableView.m
//  ICUE
//
//  Created by APPLE on 2017/10/27.
//  Copyright © 2017年 com.icue. All rights reserved.
//

#import "IQTableView.h"

@interface IQTableView ()<UIGestureRecognizerDelegate>
{
    BOOL _autoMoveToBottom;
    BOOL _autoCurrentOffset;
    BOOL _autoMoveToBottomAnimated;
}

@end

@implementation IQTableView

- (void)setContentSize:(CGSize)contentSize {
    
    if (_autoCurrentOffset) {
        
        //計算當前位置
        if (!CGSizeEqualToSize(contentSize, CGSizeZero) &&
            contentSize.height > self.frame.size.height) {
            
            CGPoint offset = self.contentOffset;
            if (offset.y != 0) {
                offset.y += (contentSize.height - self.contentSize.height);
                self.contentOffset = offset;
            }
        }
    }
    [super setContentSize:contentSize];
    
    if (!_autoCurrentOffset && _autoMoveToBottom){
            
        if (contentSize.height >self.frame.size.height) {
            
            self.scrollEnabled = NO;
            CGFloat offetY = contentSize.height - self.frame.size.height;
            if (_autoMoveToBottomAnimated) {
                [UIView animateWithDuration:0.3 animations:^{
                    self.contentOffset = CGPointMake(0, offetY);
                }];
            }else {
                
                self.contentOffset = CGPointMake(0, offetY);
            }
            self.scrollEnabled = YES;
        }
    }
}

- (void)setContentOffset:(CGPoint)contentOffset {
    
    [super setContentOffset:contentOffset];
}

- (void)reloadMoveToBottom {
    
    _autoCurrentOffset = NO;
    _autoMoveToBottom = YES;
    [self reloadData];
}

- (void)reloadMoveToBottomAnimated {
    
    _autoMoveToBottomAnimated = YES;
    [self reloadMoveToBottom];
    
}

- (void)reloadCurrentOffset {
    
    _autoMoveToBottom = NO;
    _autoMoveToBottomAnimated = NO;
    _autoCurrentOffset = YES;
    [self reloadData];
}

- (void)defaultReloadData {
    
    _autoCurrentOffset = NO;
    _autoMoveToBottom = NO;
    _autoMoveToBottomAnimated = NO;
    [self reloadData];
}

- (void)resetDefault {
    
    _autoMoveToBottom = NO;
    _autoMoveToBottom = NO;
    _autoMoveToBottomAnimated = NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return self.shouldRecognizeSimultaneously;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
