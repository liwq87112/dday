//
//  DialogBox.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/22.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DialogBox : UIView 
typedef NS_ENUM(NSUInteger, DDAOperation) {
    DDAModifyNickname        = 0,
    DDABuildingICUC          = 1
};
typedef void (^FinishBlock)(id response);
@property (nonatomic , copy) FinishBlock finishBlock;
@property (weak, nonatomic) IBOutlet UIView *dialogView;
//  修改昵称
@property (weak, nonatomic) IBOutlet UIView * BGView;
@property (weak, nonatomic) IBOutlet UILabel * TtitleLabel;
@property (weak, nonatomic) IBOutlet UIView * textfileBottomView;
@property (weak, nonatomic) IBOutlet UITextField * textfield;
@property (weak, nonatomic) IBOutlet UIButton * cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton * ensureBtn;
//@property (nonatomic, strong) NSString * TextID;
//  ICUC
@property (weak, nonatomic) IBOutlet UIView *icucView;

+ (DialogBox *)getInstance;
- (void)showDialogBoxWithOperation:(DDAOperation)operation FinishBlock:(FinishBlock)finishBlock;

@end
