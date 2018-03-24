//
//  Pop-upMenuSingleton.h
//  DDAYGO
//
//  Created by Login on 2017/9/19.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pop-upPrefixHeader.pch"
@interface Pop_upMenuSingleton : NSObject

/** 创建单例
 *
 *
 */
+ (Pop_upMenuSingleton *) shareManager;


//** 创建一个弹出菜单
//*
// * @param frame 视图尺寸
// * @param titles 文字
// * @param images 图片
// * @param action 回调点击方法
// */

- (void) showPopMenuSelecteWithFrame:(CGFloat)width
                                item:(NSArray *)item
                              action:(void(^)(NSInteger index))action;

/** 隐藏菜单
 *
 *
 */
- (void) hideMenu;

@end
