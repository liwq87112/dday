//
//  Pop-upTableViewDataSource.h
//  DDAYGO
//
//  Created by Login on 2017/9/19.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Pop_upMenuModle, Pop_upViewCell;
/**
 * 由model 设置cell 的回调
 */
typedef void(^TableViewCellConfigureBlock) (Pop_upViewCell * cell, Pop_upMenuModle * model);

@interface Pop_upTableViewDataSource : NSObject <UITableViewDataSource>

/**
 *  创建数据源管理
 *
 *  @param anItems             数据源
 *  @param cellClass           cell 类
 *  @param aConfigureCellBlock 设置cell的回调
 */
- (instancetype) initWithItems:(NSArray *)anItems
                     cellClass:(Class)cellClass
            configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;



@end
