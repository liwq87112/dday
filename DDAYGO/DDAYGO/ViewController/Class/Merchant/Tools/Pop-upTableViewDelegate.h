//
//  Pop-upTableViewDelegate.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/19.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pop-upPrefixHeader.pch"

/**
 * 点击cell事件回调
 */
typedef void(^TableViewDidSelectRowAtIndexPath)(NSInteger indexRow);

@interface Pop_upTableViewDelegate : NSObject <UITableViewDelegate>

/**
 * 对 cell 代理初始化
 */
- (instancetype) initWithDidSelectRowAtIndexPath:(TableViewDidSelectRowAtIndexPath)tableViewDidSelectRowAtIndexPath;


@end
