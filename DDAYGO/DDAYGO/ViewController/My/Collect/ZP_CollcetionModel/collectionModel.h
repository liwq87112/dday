//
//  collectionModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/24.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface collectionModel : NSObject
//商品名称
@property (nonatomic, strong) NSString * productname;
//商品默认图片
@property (nonatomic, strong) NSString * defaultimg;
//创建时间
@property (nonatomic, strong) NSString * createtime;
//用户ID
@property (nonatomic, strong) NSNumber * aid;
//商品状态
@property (nonatomic, strong) NSNumber * collectionid;
//商品cp
@property (nonatomic, strong) NSNumber * cp;
//商品ID
@property (nonatomic, strong) NSNumber * productid;
//货币符号
@property (nonatomic, strong) NSString * CurrencySymbolLabel;
//商品价格
@property (nonatomic, strong) NSNumber * productprice;
//商品状态
@property (nonatomic, strong) NSNumber * state;

+ (NSMutableArray *)arrayWithArray:(NSArray *)array;

@end
