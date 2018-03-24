//
//  MerchantModel.m
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/22.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import "MerchantModel.h"
#import "PrefixHeader.pch"
@implementation MerchantModel
+ (NSMutableArray *)Merchant:(NSArray *)array {
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    for (NSDictionary * dic in array) {
        MerchantModel * model = [[MerchantModel alloc]init];
        model.defaultimg = [NSString stringWithFormat:@"%@%@",ImgAPI,dic[@"defaultimg"]];
        model.productprice = dic[@"productprice"];
        model.productname = dic[@"productname"];
        model.cp = dic[@"cp"];
        model.productid = dic[@"productid"];
        [arr addObject:model];
    }
    return arr;
}
@end
