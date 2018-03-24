//
//  SatisfactionSurveyModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/19.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SatisfactionSurveyModel : NSObject
@property (nonatomic, strong) NSNumber * aid;
@property (nonatomic, strong) NSString * realname; // 用户名字
@property (nonatomic, strong) NSString * email; // 邮箱
@property (nonatomic, strong) NSString * reviewscontent; // 评论
@property (nonatomic, strong) NSNumber * fraction; // 评分
@property (nonatomic,strong) NSString * createtime; // 评价时间

+ (NSMutableArray *)SatisfactionSurvey:(NSArray *)array;
@end
