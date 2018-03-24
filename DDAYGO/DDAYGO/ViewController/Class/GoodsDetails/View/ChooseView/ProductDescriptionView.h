//
//  ProductDescriptionView.h
//  DDAYGO
//
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDescriptionView : UIView
@property (weak, nonatomic) IBOutlet UIView *BGView;
@property (weak, nonatomic) IBOutlet UIView *detailView;

- (void)show;

@end
