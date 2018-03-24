//
//  SupplierTableViewCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/28.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SupplierTableViewCell : UITableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@property (weak, nonatomic) IBOutlet UITextField * textField;

@property (nonatomic, copy) void (^ savaData)(NSString *title);

@end
