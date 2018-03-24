//
//  SelectModel.m
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/12.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import "SelectModel.h"

@implementation SelectModel

@end

@implementation SelectModel1

+ (instancetype)GetConfirmPayData:(NSDictionary *)dic {
    return [[self alloc]initWithConfirmPayData:dic];
}
- (instancetype)initWithConfirmPayData:(NSDictionary *)Dic {
    if (self == [super init]) {
        self.reasonid = Dic[@"reasonid"];
        self.reasonstr = Dic[@"reasonstr"];
    }
    return self;
}
+ (id)cheakNull:(id)dic {
    if ([dic isEqual:[NSNull null]]) {
        return @"";
    }
    return dic;
}
+ (NSMutableArray *)arrayWithArray:(NSArray *)array {
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    for (NSDictionary * dic in array) {
        SelectModel1 * model = [[SelectModel1 alloc]init];
        model.reasonid = dic[@"reasonid"];
        //        [NSString stringWithFormat:@"http://www.ddaygo.com%@", dic[@"logourl"]];;
        model.reasonstr = dic[@"reasonstr"];
        [arr addObject:model];
    }
    return arr;
}

@end

/*********model2************/
@implementation SelectModel2


@end
