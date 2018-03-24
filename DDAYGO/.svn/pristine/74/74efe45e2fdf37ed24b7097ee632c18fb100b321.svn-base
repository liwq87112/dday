//
//  SecondViewCell.m
//  DDAYGO
//
//  Created by Login on 2017/9/12.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "SecondViewCell.h"
#import "PrefixHeader.pch"
@implementation SecondViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:@"Secondcell"];
    if (self) {
        self.contentView.userInteractionEnabled = YES;
    }
    return self;
}
- (void)Second:(NSArray *)sup {
    
    NSInteger num = 0;
    for (int z = 0; z <= 1; z ++) {
        
        for (int i = 0; i <= 1; i ++) {
            
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * ZP_Width / 2, z * ZP_Width / 2, ZP_Width / 2, ZP_Width / 2)];
            imageView.tag = num;
            [imageView setImage:[UIImage imageNamed:@"seven"]];
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer  * singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonType:)];
            [imageView addGestureRecognizer:singleTap];
            [self addSubview:imageView];
            
            num ++;
        }
    }
}

- (void)buttonType:(UITapGestureRecognizer *)tap {
    
    self.SecondBlock(tap.view.tag);
}



@end
