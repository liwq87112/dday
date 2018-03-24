//
//  ZP_FifthModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/25.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZP_FifthModel : NSObject
@property (nonatomic, strong) NSString * defaultimg; // 主图
@property (nonatomic, strong) NSString * productname; // 标题
@property (nonatomic, strong) NSString * PreferentialLabel; // 优惠价格
@property (nonatomic, strong) NSString * priceLabel; // 价格
@property (nonatomic, strong) NSString * TrademarkLabel; // 商标编号
@property (nonatomic, strong) NSNumber * producid; // 商标id

+ (instancetype)GetFifthData:(NSDictionary *)dic;

+ (NSMutableArray *)arrayWithArray:(NSArray *)array;

@end
