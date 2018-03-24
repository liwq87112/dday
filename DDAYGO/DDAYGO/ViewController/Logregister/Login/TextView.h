//
//  TextView.h
//  com
//
//  Created by lwq on 2016/11/11.
//  Copyright © 2016年 com.xssd. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface TextView : UIView

@property (strong, nonatomic)  UILabel *titleLabel;
@property (strong, nonatomic)  UITextField *textField;
@property (strong, nonatomic)  UIButton * functionBtn;

@property (copy, nonatomic)IBInspectable NSString *titleStr;
@property (copy, nonatomic)IBInspectable UIColor *btnColour;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (copy, nonatomic)IBInspectable UIColor *textFieldBGColour;
@property  (assign, nonatomic)IBInspectable BOOL showBtn;
@property  (assign, nonatomic)IBInspectable BOOL secureTextEntry;
@property  (assign, nonatomic)IBInspectable NSInteger keyboardType;
@property  (copy, nonatomic) NSString *btnTitle;
@property  (assign, nonatomic) BOOL showEyeBtn;

@end
