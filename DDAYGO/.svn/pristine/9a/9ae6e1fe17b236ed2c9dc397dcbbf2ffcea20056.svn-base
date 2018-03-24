//
//  PayViewCell.m
//  DDAYGO
//
//  Created by Login on 2017/10/10.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "PayViewCell.h"

@implementation PayViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)Determine:(id)sender {
    
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"提示", nil) message:NSLocalizedString(@"付款成功",nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"确定",nil) otherButtonTitles:NSLocalizedString(@"取消",nil), nil];
        [alertView show];
}

// 键盘弹起

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    textField.keyboardType = UIKeyboardTypeNumberPad
    [super touchesBegan:touches withEvent:event];
    [self.PayTextField resignFirstResponder];
}

@end
