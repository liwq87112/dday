//
//  SelectModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/12.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SelectModel1;
@class SelectModel2;
@interface SelectModel : NSObject
@property (nonatomic, strong)NSDictionary * refundinfo;

@end
/**********model1**********/
@interface SelectModel1 : NSObject
@property (nonatomic, strong) NSNumber * reasonid; // ID
@property (nonatomic, strong) NSString * reasonstr; // 状态
+ (NSMutableArray *)arrayWithArray:(NSArray *)array;
@end


/**********model2**********/
@interface SelectModel2 : NSObject
//@property (nonatomic, strong) NSString * refundinfo; // 字典
@property (nonatomic, strong) NSString * productname; // 商品名字
@property (nonatomic, strong) NSNumber * ordersnumber; // 订单号
@property (nonatomic, strong) NSNumber * ordersamount; // 订单金额
@property (nonatomic, strong) NSNumber * productamount; // 商品金额
@property (nonatomic, strong) NSNumber * freight;  // 运费金额
@property (nonatomic, strong) NSNumber * state;  // 订单状态
@property (nonatomic, strong) NSString * defaultimg; // 图片
@end
