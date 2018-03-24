//
//  PayViewCell.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/10.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "PayViewCell.h"
#import "PrefixHeader.pch"
@implementation PayViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _PayTextField.clearButtonMode = UITextFieldViewModeWhileEditing;  // 一键删除文字
}

- (IBAction)Determine:(id)sender {
    if (_PayTextField.text.length>0) {
        self.PayBlock(_PayTextField.text);
    }else{
        NSLog(@"money not empty！");
        [ZPProgressHUD showErrorWithStatus:MyLocal(@"Please enter amount")];
    }
}

- (void)initWithName:(NSString *)name NameId:(NSString *)nameId {
    _BusinessNameLabel.text = name;
    NSLog(@"id = %@",nameId);
}

// 键盘弹起
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.PayTextField resignFirstResponder];
}

@end
