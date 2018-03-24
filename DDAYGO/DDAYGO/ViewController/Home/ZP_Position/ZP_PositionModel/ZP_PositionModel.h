//
//  ZP_PositionModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/14.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZP_PositionModel : NSObject
@property (nonatomic, strong) NSNumber * code; // 标题
@property (nonatomic, strong) NSString * imgurl; // 图片
@property (nonatomic, strong) NSString * name; //名字

- (instancetype)gEtininWithPosition:(NSDictionary *)dic;

+ (NSMutableArray *)arrayWithArray:(NSArray *)array;
@end
