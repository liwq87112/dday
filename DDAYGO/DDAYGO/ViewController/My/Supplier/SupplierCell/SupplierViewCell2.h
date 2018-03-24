//
//  SupplierViewCell2.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/29.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SupplierViewCell2 : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *TissueMorphologyLabel;
@property (weak, nonatomic) IBOutlet UIButton * SelectBut;

typedef void (^FinishBlock)(id response);

@property (nonatomic , copy) FinishBlock finishBlock;

@end
