//
//  OrdeHeadViewCell.m
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/28.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import "OrdeHeadViewCell.h"
#import "PrefixHeader.pch"

@implementation OrdeHeadViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:@"OrdeHeadViewCell"];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    //  订单号
    ZP_GeneralLabel * OrderLabel = [ZP_GeneralLabel initWithtextLabel:_OrderLabel.text textColor:ZP_textblack font:ZP_titleFont textAlignment:NSTextAlignmentLeft bakcgroundColor:nil];
    OrderLabel.text = NSLocalizedString(@"order number:", nil);
    [self.contentView addSubview:OrderLabel];
    [OrderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self).offset(7);
    }];
    _OrderLabel = OrderLabel;
    
    //  ID号
    ZP_GeneralLabel * IDLabel = [ZP_GeneralLabel initWithtextLabel:_IDLabel.text textColor:ZP_textblack font:ZP_titleFont textAlignment:NSTextAlignmentLeft bakcgroundColor:ZP_WhiteColor];
    [self.contentView addSubview:IDLabel];
    [IDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(50);
        make.top.equalTo(OrderLabel).offset(0);
    }];
    _IDLabel = IDLabel;
    
    //  日期
    ZP_GeneralLabel * DateLabel = [ZP_GeneralLabel initWithtextLabel:_DateLabel.text textColor:ZP_textblack font:ZP_introduceFont textAlignment:NSTextAlignmentLeft bakcgroundColor:ZP_WhiteColor];
    [self.contentView addSubview:DateLabel];
    [DateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.top.equalTo(IDLabel).offset(15);
    }];
    _DateLabel = DateLabel;
    
    //    删除订单按钮
    UIButton * DeleteBut = [UIButton buttonWithType:UIButtonTypeSystem];
    [DeleteBut setBackgroundImage:[UIImage imageNamed:@"ic_footprint_delete_normal"] forState:UIControlStateNormal];
    //    [DeleteBut addTarget:self action:@selector(DeleteBut:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:DeleteBut];
    [DeleteBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(self).offset(10);
        make.width.mas_offset(15);
        make.height.mas_offset(15);
    }];
    _DeleteBut = DeleteBut;
    
    //  交易状态
    ZP_GeneralLabel * TradingLabel = [ZP_GeneralLabel initWithtextLabel:_TradingLabel.text textColor:ZP_typefaceOrangeColor font:ZP_titleFont textAlignment:NSTextAlignmentLeft bakcgroundColor:nil];
    [self.contentView addSubview:TradingLabel];
    [TradingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(DeleteBut).offset(0);
        make.right.equalTo(DeleteBut).offset(-25);
    }];
    _TradingLabel = TradingLabel;
}

- (void)InformationWithDic:(OrdersdetailModel *)dic WithModel:(OrderModel *)model {
    _IDLabel.text = [NSString stringWithFormat:@"%@",dic.ordersnumber];
    _DateLabel.text = model.createtime;
    int a = [dic.state intValue];
    ZPLog(@"Stata = %D",a);
    switch (a) {
        case 0:
            break;
        case 1:
            _TradingLabel.text = MyLocal(@"Waiting payment");
            _DeleteBut.hidden = NO;
            break;
        case 2:
            _TradingLabel.text = MyLocal(@"Wait delivery");
            _DeleteBut.hidden = YES;
            break;
        case 3:
            _TradingLabel.text = MyLocal(@"Waiting goods");
            _DeleteBut.hidden = YES;
            break;
        case 4:
            _TradingLabel.text = MyLocal(@"successful deal");
            _DeleteBut.hidden = NO;
            break;
        case 5:
            _TradingLabel.text = MyLocal(@"Has been cancelled");
            _DeleteBut.hidden = NO;
            break;
        case 6:
            _TradingLabel.text = MyLocal(@"Refund / after sale");
            _DeleteBut.hidden = YES;
            break;
        case 7:
            _TradingLabel.text = MyLocal(@"In exchange");
            _DeleteBut.hidden = YES;
            break;
        default:
            break;
    }
}
@end

