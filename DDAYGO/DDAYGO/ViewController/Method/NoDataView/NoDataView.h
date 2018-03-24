//
//  NoDataView.h
//  DDAYGO
//
//  Created by 小树普惠 on 2018/2/1.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^FinishBlock)(id response);
@interface NoDataView : UIView
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
+ (void)initWithSuperView:(UIView *)superView Content:(NSString *)content FinishBlock:(FinishBlock)finishBlock;
@end
