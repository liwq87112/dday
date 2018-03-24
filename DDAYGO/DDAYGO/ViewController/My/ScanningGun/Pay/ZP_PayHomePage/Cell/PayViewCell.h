//
//  PayViewCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/10.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *BusinessImage; // 商家图片
@property (strong, nonatomic) IBOutlet UILabel *BusinessNameLabel; // 商家名字
@property (weak, nonatomic) IBOutlet UITextField * PayTextField;   // 输入框
@property (nonatomic, copy) void(^PayBlock)(NSString * text);

- (void)initWithName:(NSString *)name NameId:(NSString *)nameId;
@end
