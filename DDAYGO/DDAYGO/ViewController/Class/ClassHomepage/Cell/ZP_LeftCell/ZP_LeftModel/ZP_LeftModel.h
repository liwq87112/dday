//
//  ZP_LeftModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/26.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZP_LeftModel : NSObject
@property (nonatomic, strong) NSString * contentLabel; // 文字
@property (nonatomic, strong) NSNumber  * producttypeid ;
+ (instancetype)GetLeftData:(NSDictionary *)Dic;

+(NSMutableArray *)arrayWithArray:(NSArray *)array;
@end
