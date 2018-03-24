//
//  ZP_ShopManagementModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/5.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZP_ShopManagementModel : NSObject
@property (nonatomic, strong) NSNumber * supplierid;  //供货商ID
@property (nonatomic, strong) NSNumber * aid;  // 用户ID
@property (nonatomic, strong) NSString * suppliername;  // 供货商名称
@property (nonatomic, strong) NSString * companyname;  // 公司名称
@property (nonatomic, strong) NSNumber * countrycode;  // 国家编码
@property (nonatomic, strong) NSNumber * balance; // 供货商成本余额
@property (nonatomic, strong) NSNumber * iceamount;  // 冻结金额
@property (nonatomic, strong) NSNumber * allamount;  // 总金额

+ (instancetype)CreateWithDict:(NSDictionary *)dict;

@end
