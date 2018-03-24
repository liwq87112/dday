//
//  ZP_InstructionBetModel.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/4.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <Foundation/Foundation.h>
@class InstructionBetModel;
@class InstructionBetMode2;
@class InstructionBetMode3;
@class InstructionBetMode4;
@class InstructionBetMode5;
@interface ZP_InstructionBetModel : NSObject
@property (nonatomic, strong) NSArray<InstructionBetModel *> * lotterywin;
@end


@interface InstructionBetModel : NSObject
@property (nonatomic, strong) NSNumber * winamount;
@end


@interface InstructionBetMode2 : NSObject
@property (nonatomic, strong) NSNumber * winamount;
@end


@interface InstructionBetMode3 : NSObject
@property (nonatomic, strong) NSNumber * winamount;
@end


@interface InstructionBetMode4 : NSObject
@property (nonatomic, strong) NSNumber * winamount;
@end


@interface InstructionBetMode5 : NSObject
@property (nonatomic, strong) NSNumber * winamount;
@end
