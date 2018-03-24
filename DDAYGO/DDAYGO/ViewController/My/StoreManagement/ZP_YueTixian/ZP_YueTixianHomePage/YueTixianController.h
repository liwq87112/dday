//
//  YueTixianController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/4.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextView.h"
#import "PromptBoxView.h"
@interface YueTixianController : PromptBoxView
@property (strong, nonatomic) IBOutlet UIScrollView * TikuanscrollView;

@property (strong, nonatomic) IBOutlet TextView * amountText;
@property (strong, nonatomic) IBOutlet TextView * payeeText;
@property (strong, nonatomic) IBOutlet TextView * CollectingBankText;
@property (strong, nonatomic) IBOutlet TextView * PaymentAccountText;
@property (strong, nonatomic) IBOutlet TextView * reservedPhoneText;
@property (strong, nonatomic) IBOutlet TextView * emailText;

/**
 * 供货商ID
 */
@property (nonatomic, strong) NSNumber * SupplierId;

@end
