//
//  ReceivingViewCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/10.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceivingViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView * imageview;

- (void)getInitWithUrl:(NSString *)url;
@end
