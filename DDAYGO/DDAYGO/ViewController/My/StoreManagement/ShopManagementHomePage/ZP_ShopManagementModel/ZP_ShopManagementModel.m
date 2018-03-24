//
//  ZP_ShopManagementModel.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/5.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "ZP_ShopManagementModel.h"

@implementation ZP_ShopManagementModel

//+ (NSDictionary *)ShopManagement:(NSArray *)array {
//    NSMutableArray * arr = [[NSMutableArray alloc]init];
//    for (NSDictionary * dic in array) {
//        ZP_ShopManagementModel * model = [[ZP_ShopManagementModel alloc]init];
//        model
//    }
//}
+ (instancetype)CreateWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    };
    return self;
}
- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key {
    
}
@end
