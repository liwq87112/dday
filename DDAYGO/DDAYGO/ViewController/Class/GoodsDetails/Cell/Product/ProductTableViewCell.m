//
//  ProductTableViewCell.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/11.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "ProductTableViewCell.h"

@implementation ProductTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (UIImageView *)productImageView {
    [_productImageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    _productImageView.contentMode =  UIViewContentModeScaleAspectFill;
    _productImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _productImageView.layer.contentsGravity = kCAGravityResizeAspectFill;
    _productImageView.clipsToBounds  = YES;
    return _productImageView;
}

@end
