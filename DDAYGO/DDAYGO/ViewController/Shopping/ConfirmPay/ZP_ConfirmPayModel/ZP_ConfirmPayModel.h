//
//  ZP_ConfirmPayModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/22.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZP_ConfirmPayModel : NSObject
/**支付方式ID*/
@property (nonatomic, strong) NSString * payid;
/**支付方式名称*/
@property (nonatomic, strong) NSString * payname;
/**logo路径*/
@property (nonatomic, strong) NSString * logourl; //

+ (instancetype)GetConfirmPayData:(NSDictionary *)dic;

+ (NSMutableArray *)arrayWithArray:(NSArray *)array;
@end

