//
//  EvaluateModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/2/1.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EvaluateModel : NSObject
@property (nonatomic, strong) NSNumber * aid; // ID
@property (nonatomic, strong) NSString * realname; // 评价人名字
@property (nonatomic, strong) NSString * avatar; // 图像
@property (nonatomic, strong) NSString * createtime; // 评价时间
@property (nonatomic, strong) NSString * reviewscontent; // 评价内容
@property (nonatomic, strong) NSNumber * fraction; // 分数
+ (NSMutableArray * )EvaluateArray:(NSArray *)Array;
@end
