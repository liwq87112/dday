//
//  ZP_LoginTool.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/26.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZP_LoginTool : NSObject

// 注册
+ (void)requestRegiser:(NSDictionary *)Regiser success:(void (^)(id))success failure:(void (^)(NSError *))failure;

//  登录
+ (void)requestLogin:(NSDictionary *)Login success:(void (^)(id obj))success failure:(void (^)(NSError *error))failure;

//  获取用户信息
+ (void)getAccountInfo:(NSString *)token success:(void (^)(id))success failure:(void (^)(NSError *))failure;

// 验证码
+ (void)requestVerificationcode:(NSDictionary *)Yzm success:(void (^)(id))success failure:(void (^)(NSError *))failure;

// 地区
+ (void) requsetArea:(NSDictionary *)Area success:(void (^)(id))success failure:(void (^)(NSError *))failure;

// ICUE号首次登入（55）
+ (void)requsetICUELogin:(NSDictionary *)ICUELogin success:(void (^)(id))success failure:(void (^)(NSError *))failure;

// ICUE 首次登陆（58）
+ (void)requesForFirstTimeLogin:(NSDictionary *)ForFirstTimeLogin success:(void (^)(id))success failure:(void (^)(NSError *))failure;

// 找回密码（第一步）
+ (void)requestForgetPsw1:(NSDictionary *)ForgetPsw success:(void (^)(id))success failure:(void (^)(NSError *))failure;

// 找回密码（第二步）
+ (void)requestForgetPsw2:(NSDictionary *)ForgetPsw success:(void (^)(id))success failure:(void (^)(NSError *))failure;
@end
