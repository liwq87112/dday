//
//  PromptBox.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/6.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromptBox : UIView
typedef NS_ENUM(NSUInteger, DDAOperation)
{
    DDAModifyNickname        = 0,
    DDABuildingICUC          = 1
};
typedef void (^FinishBlock)(id response);
@property (nonatomic , copy) FinishBlock finishBlock;
@property (weak, nonatomic) IBOutlet UIView *GBView;
@property (weak, nonatomic) IBOutlet UIView *PromptBoxView;

@property (weak, nonatomic) IBOutlet UIView *EmailView;

+ (PromptBox *)getInstance;

- (void)showDialogBoxWithOperation:(DDAOperation)operation FinishBlock:(FinishBlock)finishBlock;

@end
