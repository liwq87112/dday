//
//  SatisfactionSurveyModel.m
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/19.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import "SatisfactionSurveyModel.h"

@implementation SatisfactionSurveyModel

+ (NSMutableArray *)SatisfactionSurvey:(NSArray *)array {
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    for (NSDictionary * dic in array) {
        SatisfactionSurveyModel * model = [[SatisfactionSurveyModel alloc]init];
        model.aid = dic[@"aid"];
        model.realname = dic[@"realname"];
        model.email = dic[@"email"];
        model.reviewscontent = dic[@"reviewscontent"];
        model.fraction = dic[@"fraction"];
        model.createtime = dic[@"createtime"];
        [arr addObject:model];
    }
    return arr;
}
@end
