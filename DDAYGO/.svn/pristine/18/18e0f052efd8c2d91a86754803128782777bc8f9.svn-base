//
//  ZPLoopViewCell.m
//  merchants
//
//  Created by Login on 2017/9/19.
//  Copyright © 2017年 PENG.ZHANG. All rights reserved.
//

#import "ZPLoopViewCell.h"

@interface ZPLoopViewCell ()
@property (nonatomic, weak)UIImageView *iconView;

@end

@implementation ZPLoopViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
    }
    return self;
}

- (void)setImageName:(NSString *)imageName {
    
    _imageName = imageName;
    self.iconView.image = [UIImage imageNamed:imageName];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.iconView.frame = self.bounds;
}


@end
