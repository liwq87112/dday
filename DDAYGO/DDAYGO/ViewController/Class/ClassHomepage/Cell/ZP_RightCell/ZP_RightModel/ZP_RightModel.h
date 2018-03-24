//
//  ZP_RightModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/26.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZP_RightModel : NSObject
@property (nonatomic, strong) NSString * contentLabel;

@property (nonatomic, strong) NSNumber * fatherid;
@property (nonatomic, strong) NSNumber * producttypeid;
+ (NSMutableArray *)arrayWithArray:(NSArray *)dic;
@end
