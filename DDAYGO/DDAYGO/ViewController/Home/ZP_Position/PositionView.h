//
//  PositionView.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/18.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PositionView : UIView
/**
 *  显示属性选择视图
 *
 *  @param view 要在哪个视图中显示
 */
- (void)showInView:(UIView *)view;

/**
 *  属性视图的消失
 */
- (void)removeView;

@property (nonatomic, copy) void(^ThirdBlock)(NSString *ContStr,NSNumber *code);

- (void)Position:(NSArray *)sup;

@end
