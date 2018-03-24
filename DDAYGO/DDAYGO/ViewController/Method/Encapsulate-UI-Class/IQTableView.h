//
//  IQTableView.h
//  ICUE
//
//  Created by APPLE on 2017/10/27.
//  Copyright © 2017年 com.icue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IQTableView : UITableView

//是否允許多手勢操作
@property (nonatomic,assign) IBInspectable BOOL shouldRecognizeSimultaneously;
/**
 刷新并自動移動至底部
 */
- (void)reloadMoveToBottom;
- (void)reloadMoveToBottomAnimated;

/**
 刷新並移至原位置
 */
- (void)reloadCurrentOffset;

/**
 回復默認刷新
 */
- (void)defaultReloadData;

//重置原來的狀態 
- (void)resetDefault;

@end
