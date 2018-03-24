//
//  InformationCell.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/20.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "ZP_InformationCell.h"
#import "PrefixHeader.pch"
#import "ZP_InformationModel.h"
@implementation ZP_InformationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    static NSString * InformationID = @"informationCell";
    self = [super initWithStyle:style reuseIdentifier:InformationID];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    //  背景view
    UIView * Backgroundview = [UIView new];
    Backgroundview.layer.borderWidth = 1;
    Backgroundview.backgroundColor = ZP_Graybackground;
    Backgroundview.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    [self.contentView addSubview:Backgroundview];
    [Backgroundview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.height.mas_equalTo(95);
        make.width.mas_equalTo(ZP_Width);
    }];
    
    //  主图
    UIImageView * FigureImage = [UIImageView new];
    [FigureImage setContentScaleFactor:[[UIScreen mainScreen] scale]];
    FigureImage.contentMode =  UIViewContentModeScaleAspectFill;
    FigureImage.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    FigureImage.clipsToBounds  = YES;
    [self.contentView addSubview:FigureImage];
    [FigureImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Backgroundview).offset(5);
        make.top.equalTo(Backgroundview).offset(5);
        make.width.mas_equalTo(85);
        make.height.mas_equalTo(85);
    }];
    _FigureImage = FigureImage;
    
    //  商品文字
    UILabel * titleLabel = [UILabel new];
    titleLabel.textColor = ZP_textblack;
    titleLabel.lineBreakMode = NSLineBreakByWordWrapping; //文字分行
    titleLabel.numberOfLines = 0;
    titleLabel.font = ZP_titleFont;
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(FigureImage).offset(90);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(Backgroundview).offset(10);
    }];
    _titleLabel = titleLabel;
    
    //  250ml升级装
    UILabel * descLabel = [UILabel new];
    descLabel.textColor = ZP_TypefaceColor;
    descLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(80);
        make.top.equalTo(titleLabel).offset(30);
    }];
    _descLabel = descLabel;
    //  货币符号
    UILabel * CurrencySymbolLabel = [UILabel new];
    CurrencySymbolLabel.textAlignment = NSTextAlignmentLeft;
    CurrencySymbolLabel.textColor = ZP_pricebackground;
    CurrencySymbolLabel.font = ZP_titleFont;
    //    NSString * str = [[NSUserDefaults standardUserDefaults] objectForKey:@"symbol"];
    //    CurrencySymbolLabel.text = [NSString stringWithFormat:@"%@",str];
    CurrencySymbolLabel.text = DD_MonetarySymbol;
    [self.contentView addSubview:CurrencySymbolLabel];
    [CurrencySymbolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(FigureImage).offset(90);
        make.top.equalTo(descLabel).offset(15);
    }];
    _CurrencySymbolLabel = CurrencySymbolLabel;
    //  优惠价格
    UILabel * PreferentialLabel = [UILabel new];
    PreferentialLabel.textAlignment = NSTextAlignmentLeft;
    PreferentialLabel.textColor = ZP_pricebackground;
    PreferentialLabel.font = ZP_titleFont;
    [self.contentView addSubview:PreferentialLabel];
    [PreferentialLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(CurrencySymbolLabel).offset(20); // 左
        make.top.equalTo(CurrencySymbolLabel).offset(0); // 上
    }];
    _PreferentialLabel = PreferentialLabel;
    
    //  商标
    UIImageView * TrademarkImage = [UIImageView new];
    [self.contentView addSubview:TrademarkImage];
    [TrademarkImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-75); // 右
        make.top.equalTo(PreferentialLabel).offset(0);
        make.width.mas_offset(15);
        make.height.mas_offset(15);
    }];
    _TrademarkImage = TrademarkImage;
    
    //  商标编号
    UILabel * TrademarkLabel = [UILabel new];
    TrademarkLabel.textAlignment = NSTextAlignmentLeft;
    TrademarkLabel.textColor = ZP_textblack;
    TrademarkLabel.font = ZP_TrademarkFont;
    [self.contentView addSubview:TrademarkLabel];
    [TrademarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(TrademarkImage).offset(20);
        make.top.equalTo(TrademarkImage).offset(2.5);
    }];
    _TrademarkLabel = TrademarkLabel;
    
    //  符号X
    UILabel * SharacterLabel = [UILabel new];
    SharacterLabel.textAlignment = NSTextAlignmentLeft;
    SharacterLabel.textColor = ZP_TypefaceColor;
    SharacterLabel.font = ZP_TrademarkFont;
    [self.contentView addSubview:SharacterLabel];
    SharacterLabel.text = @"X";
    [SharacterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-25);
        make.top.equalTo(TrademarkLabel).offset(0);
    }];
    _SharacterLabel = SharacterLabel;
    
    //  数量
    UILabel * QuantityLabel = [UILabel new];
    QuantityLabel.textAlignment = NSTextAlignmentLeft;
    QuantityLabel.textColor = ZP_TypefaceColor;
    QuantityLabel.font = ZP_TrademarkFont;
    [self.contentView addSubview:QuantityLabel];
    [QuantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(SharacterLabel).offset(10);
        make.top.equalTo(SharacterLabel).offset(0);
    }];
    _QuantityLabel = QuantityLabel;
    
    //  下划线
    UIView * Underline1 = [UIView new];
    Underline1.layer.borderWidth = 1;
    Underline1.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.contentView addSubview:Underline1];
    [Underline1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(5);
        make.bottom.equalTo(self).offset(0);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(ZP_Width - 75);
    }];
}

- (void)InformationWithDic:(ZP_InformationModel *)model {
    [_FigureImage sd_setImageWithURL:[NSURL URLWithString:model.defaultimg] placeholderImage:[UIImage imageNamed:@""]];
    _titleLabel.text = model.productname;
    _PreferentialLabel.text = [NSString stringWithFormat:@"%@",model.productprice]; // 优惠价格
    _TrademarkImage.image = [UIImage imageNamed:@"ic_cp"];
    _TrademarkLabel.text = model.cp;
    _QuantityLabel.text = model.amount;
    _ComputationsLabel.text = [NSString stringWithFormat:@" %.2f",model.amount.intValue * model.productprice.floatValue];
    
}

@end
