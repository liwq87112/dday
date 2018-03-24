//
//  ShoppingCell.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/12.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZP_ShoppingModel.h"

@interface ShoppingCell : UITableViewCell
@property (nonatomic, strong) UIButton * buttom;  // 选择按钮
@property (nonatomic, strong) UIImageView * leftImageView;  // 主图
@property (nonatomic, strong) UILabel * titleLabel;  // 标题
@property (nonatomic, strong) UILabel * MerchandiseIntroducedLabel; // 商品介绍
@property (nonatomic, strong) UILabel * descLabel;  // 规格
@property (nonatomic, strong) UILabel * PreferentialLabel;  // 颜色
@property (nonatomic, strong) UILabel * SizeLabel;  // 尺码
@property (nonatomic, strong) UILabel * CurrencySymbolLabel; // 货币符号
@property (nonatomic, strong) UILabel * PriceLabel;  // 价格
@property (nonatomic, strong) UIView * backView;  // 竖线
@property (nonatomic, strong) UIImageView * TrademarkImage;  // 商标图
@property (nonatomic, strong) UILabel * TrademarkLabel;  // 商标编号
@property (nonatomic, strong) UILabel * QuantityLabel;  // 数量
@property (nonatomic, strong) UILabel * SharacterLabel;  // X

- (void)cellWithModel:(ZP_CartsModel *)model andIndexObject:(NSString *)str;



/**
 编辑下的View
 */
@property (nonatomic, strong) UIButton * Reducebutton;   // 减少按钮
@property (nonatomic, strong) UILabel * numLabel;  // 数量
@property (nonatomic, strong) UIButton * addButton;  // 增加
@property (nonatomic, copy) void (^btnClickBlock) (NSString * str);
@end

