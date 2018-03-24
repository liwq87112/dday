//
//  ZP_PositionModel.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/14.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "ZP_PositionModel.h"

@implementation ZP_PositionModel

+ (instancetype)gEtPosition:(NSDictionary *)Dic {
    return [[self alloc]gEtininWithPosition:Dic];
}

- (instancetype)gEtininWithPosition:(NSDictionary *)dic {
    if (self == [super init]) {
        self.code = dic[@"code"];
        self.imgurl = dic[@"imgurl"];
        self.name = dic[@"name"];
        
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
        ZP_PositionModel * model = [[ZP_PositionModel alloc]init];
        model.code = dic[@"code"];
        model.imgurl = dic[@"imgurl"];
        model.name = dic[@"name"];
        [arr addObject:model];
    }
    return arr;
}

@end
