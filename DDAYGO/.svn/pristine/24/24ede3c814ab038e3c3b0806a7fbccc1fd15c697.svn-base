//
//  ReceivingViewCell.m
//  DDAYGO
//
//  Created by Login on 2017/10/10.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "ReceivingViewCell.h"
#import "PrefixHeader.pch"
#import <CoreImage/CoreImage.h>
#import "CIImage+Extension.h"
@implementation ReceivingViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initUI];
    
}

- (void)initUI{
    
//  1.创建滤镜对象
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
//  2.恢复默认设置
    [filter setDefaults];
    
//  3.设置数据
//    NSString *info = @"https://www.apple.com";
    NSString * info = @"50";
    NSData *infoData = [info dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:infoData forKeyPath:@"inputMessage"];
    
    // 4.生成二维码
    CIImage *outputImage = [filter outputImage];
    
    self.imageview.image = [outputImage createNonInterpolatedWithSize:150];
}


@end
