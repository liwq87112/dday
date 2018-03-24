//
//  ZP_ComfirmModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/22.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZP_ComfirmModel : NSObject

@property (nonatomic, strong) NSString * receiptname; // 收货人姓名
@property (nonatomic, strong) NSString * receiptphone; // 收货人手机
@property (nonatomic, strong) NSString * addressdetail; // 收货人详细地址
@property (nonatomic, strong) NSNumber * addressid;
@property (nonatomic, strong) NSNumber * isdefault;

+ (instancetype)GetComfirmData:(NSDictionary *)dic;

+ (NSMutableArray *)arrayWithArray:(NSArray *)array;
@end

