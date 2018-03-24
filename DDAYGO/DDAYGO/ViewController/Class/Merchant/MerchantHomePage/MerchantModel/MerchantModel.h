//
//  MerchantModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/22.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MerchantModel : NSObject
@property (nonatomic, strong) NSString * defaultimg; // 图片
@property (nonatomic, strong) NSNumber * cp; // 编号
@property (nonatomic, strong) NSNumber * productprice; // 价格
@property (nonatomic, strong) NSString * productname; //商品名字
@property (nonatomic, strong) NSString * productremark;
@property (nonatomic, strong) NSNumber * productid; //商品ID

+ (NSMutableArray *)Merchant:(NSArray *)array;

@end
