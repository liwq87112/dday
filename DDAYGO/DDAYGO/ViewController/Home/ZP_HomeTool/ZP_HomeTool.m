//
//  ZP_HomeTool.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/10.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "ZP_HomeTool.h"
#import "ZP_NetorkingTools.h"
#import "PrefixHeader.pch"
@implementation ZP_HomeTool
// 获取国家列表
+ (void)requesPosition:(NSDictionary *)Position success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    [ZP_NetorkingTools GET:[NSString stringWithFormat:@"%@%@",URLAPI,Psoitions] parameters:Position success:^(NSDictionary *responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

// 74) 查询广告列表
+ (void)requestGetadvertlist:(NSDictionary *)Getadvertlist success:(void(^)(id obj))success failure:(void (^)(NSError *error))failure {
    
    [ZP_NetorkingTools GET:[NSString stringWithFormat:@"%@getadvertlist?adcode=%@&countrycode=%@",URLAPI,Getadvertlist[@"adcode"],Getadvertlist[@"countrycode"]] parameters:nil success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError * error) {
        failure(error);
    }];
}

//  获取首页八大分类
+ (void)requesFirst:(NSDictionary *)First success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    [ZP_NetorkingTools GET:[NSString stringWithFormat:@"%@gethometypes?countrycode=%@",URLAPI,First[@"countrycode"]] parameters:nil success:^(NSDictionary *responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

// 热销商品
+ (void)requestSellLikeHotCakes:(NSDictionary *)sd success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    [ZP_NetorkingTools GET:[NSString stringWithFormat:@"%@%@",URLAPI,HotCakesAPI] parameters:sd success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

//// 精选商品
//+(void)requSelectLikeHotCakes:(NSDictionary *)jx success:(void (^)(id))success failure:(void (^)(NSError *))failure {
//
//    [ZP_NetorkingTools GET:[NSString stringWithFormat:@"%@%@",URLAPI,NewsReleaseAPI] parameters:jx success:^(id responseObject) {
//        success(responseObject);
//
//    } failure:^(NSError *error) {
//
//        failure(error);
//    }];
//}

// 精选商品
+(void)requSelectLikeHotCakes:(NSDictionary *)jx success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    [ZP_NetorkingTools GET:[NSString stringWithFormat:@"%@%@",URLAPI,NewsReleaseAPI] parameters:jx success:^(id responseObject) {
        success(responseObject);
        
    } failure:^(NSError *error) {
        
        failure(error);
    }];
}
@end
