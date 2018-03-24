//
//  PromptBox.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/11/6.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "PromptBox.h"
@implementation PromptBox

+ (PromptBox *)getInstance  //定义一个类方法进行访问(便利构造)
{
    static PromptBox *audioOption = nil;
    static dispatch_once_t oncet;
    dispatch_once(&oncet,^{
        audioOption = [[NSBundle mainBundle] loadNibNamed:@"PromptBox" owner:self options:nil].lastObject;
        audioOption.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    });
    if ([UIApplication sharedApplication].keyWindow) {
        [[UIApplication sharedApplication].keyWindow addSubview:audioOption];
    }
    return  audioOption;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    self.GBView.userInteractionEnabled = YES;
    [self.GBView addGestureRecognizer:tap];
    self.hidden = YES;
}
- (IBAction)icucEnsuer:(id)sender {
    [self dismiss];
}
- (void)showDialogBoxWithOperation:(DDAOperation)operation FinishBlock:(FinishBlock)finishBlock {
    
    self.finishBlock = finishBlock;
    
    switch (operation) {
        case DDAModifyNickname:
        {
            self.EmailView.hidden = YES;
        }
            break;
        case DDABuildingICUC:
        {
            self.EmailView.hidden = NO;
        }
            break;
            
        default:
            break;
    }
    
    [self show];
}

- (void)show {
    self.hidden = NO;
    self.GBView.alpha = 0;
    self.PromptBoxView.alpha = 0;
    [UIView animateWithDuration:.3f animations:^{
        self.GBView.alpha = 0.5;
        self.PromptBoxView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)dismiss {
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:.3f animations:^{
            self.GBView.alpha = 0;
            self.PromptBoxView.alpha = 0;
        } completion:^(BOOL finished) {
            self.hidden = YES;
        }];
    });
}
@end
