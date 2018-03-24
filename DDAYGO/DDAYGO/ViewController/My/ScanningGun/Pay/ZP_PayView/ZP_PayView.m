//
//  ZP_PayView.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/12/7.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "ZP_PayView.h"
#import "PrefixHeader.pch"
#import "PayMoneyViewCell.h"
#import "PayPassController.h"
#import "PayFailController.h"
#define kATTR_VIEW_HEIGHT (kHeight-215)

///******* 屏幕尺寸 *******/
#define     kWidth      [UIScreen mainScreen].bounds.size.width - 30
#define     kHeight     [UIScreen mainScreen].bounds.size.height - 50

@interface ZP_PayView ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UIView * contentView;
@property (nonatomic, strong) UIButton * Creditcardbut;
@property (nonatomic, strong) UIButton * ICUEbut;
@property (nonatomic, strong) UIView * view;
@property (nonatomic, strong) NSArray * InformatonArray;

@end

@implementation ZP_PayView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

#pragma mark - setupViews
/**
 *  设置视图的基本内容
 */
- (void)setupViews {
    //  添加手势，点击背景视图消失
    UIView * bounceView = [UIView new];
    bounceView.backgroundColor = [UIColor whiteColor];
    bounceView.layer.cornerRadius = 5.0;// View圆角弧度
    [self addSubview:bounceView];
    self.contentView = bounceView;
    [bounceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(200);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(0);
        make.width.mas_offset(ZP_Width);
    }];
    //  取消按钮
    UIButton * Cancelbut = [UIButton buttonWithType:UIButtonTypeCustom];
    [Cancelbut setImage:[UIImage imageNamed:@"ic_payment_cancel"] forState:UIControlStateNormal];
    [Cancelbut addTarget:self action:@selector(cancelbut:) forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *tapBackGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeView)];
    tapBackGesture.delegate = self;
    [self addGestureRecognizer:tapBackGesture];
    [bounceView addSubview:Cancelbut];
    [Cancelbut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bounceView).offset(10);
        make.top.equalTo(bounceView).offset(10);
    }];
    //  标题
    UILabel * titleLabel = [UILabel new];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textColor = ZP_textblack;
    titleLabel.text = MyLocal(@"Choose payment method");
    titleLabel.numberOfLines = 0;
    titleLabel.font = ZP_addBtnTextdetaFont;
    [bounceView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(215); // 上面
        make.left.equalTo(self).offset(ZP_Width / 2  - 50); // 左边
    }];
    
    for (int z = 0; z <= 3; z ++) {
        for (int i = 0; i <=2; i ++) {
            for (int x = z; x <=1; x ++) {
                self.view = [[UIView alloc]initWithFrame:CGRectMake(i * ZP_Width, z *  50+ 50 + x * 150, ZP_Width , 1)];
                [self.view setBackgroundColor:ZP_DeepBlue];
                [bounceView addSubview:self.view];
            }
        }
    }
    //    货币符号
    ZP_GeneralLabel * CurrencySymbolLabel = [ZP_GeneralLabel initWithtextLabel:_CurrencySymbolLabel.text textColor:ZP_textblack font:ZP_AmountTextFont textAlignment:NSTextAlignmentLeft bakcgroundColor:ZP_WhiteColor];
    NSString * str = [[NSUserDefaults standardUserDefaults] objectForKey:@"symbol"];
    CurrencySymbolLabel.text = [NSString stringWithFormat:@"%@",str];
    [bounceView addSubview:CurrencySymbolLabel];
    [CurrencySymbolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(260);
        make.left.equalTo(self).offset(ZP_Width / 2 - 50);
    }];
    //  金额
    ZP_GeneralLabel * AmountLabel = [ZP_GeneralLabel initWithtextLabel:_AmountLabel.text textColor:ZP_textblack font:ZP_AmountTextFont textAlignment:NSTextAlignmentLeft bakcgroundColor:ZP_WhiteColor];
    [bounceView addSubview:AmountLabel];
    [AmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(CurrencySymbolLabel).offset(0); // 上面
        make.left.equalTo(CurrencySymbolLabel).offset(35); // 左边
    }];
    _AmountLabel = AmountLabel;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.contentView addSubview:self.tableView];
    });
    
    //  支付按钮
    UIButton * Paybut = [UIButton new];
    Paybut.titleLabel.font = ZP_TooBarFont;
    Paybut.layer.borderColor = [UIColor clearColor].CGColor;
    Paybut.backgroundColor = ZP_PayColor;
    Paybut.layer.cornerRadius = 5.0;// 圆角弧度
    [Paybut setTitle:MyLocal(@"Immediate payment") forState:UIControlStateNormal];
    [Paybut addTarget:self action:@selector(paybut:) forControlEvents:UIControlEventTouchUpInside];
    [bounceView addSubview:Paybut];
    [Paybut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.bottom.equalTo(self).offset(-25);
        make.height.mas_offset(40);
    }];
}

#pragma mark - 点击支付按钮
- (void)paybut:(UIButton *)sender {
    if (_Creditcardbut.selected == _Creditcardbut.selected) {
        PayPassController * paypass = [[PayPassController alloc] init];
        if (self.confirmPayBlock) {
            self.confirmPayBlock(paypass);
        }
    }else if (_ICUEbut.selected == _ICUEbut.selected) {
        
        PayFailController * PayFail = [[PayFailController alloc] init];
        if (self.PayFailBlock) {
            self.PayFailBlock(PayFail);
        }
    }
    for (int i = 0; i < self.dataArray.count; i ++) {
        PayMoneyViewCell * cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if (cell.PayBut.selected) {
            ZP_PayModel *model = _dataArray[i];
            NSLog(@"选择支付的名字为：%@",model.payname);
            if (self.ConfirmPayMoneyBlock) {
                self.ConfirmPayMoneyBlock(model);
            }
            return;
        }else {
            [SVProgressHUD showSuccessWithStatus:MyLocal(@"Please select payment method.")];
        }
    }
}

#pragma mark - 点击事件
- (void)cancelbut:(UIButton * )sup {
    __weak typeof(self) _weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [_weakSelf removeFromSuperview];
    }];
}
#pragma mark - UIGestureRecognizerDelegate
//  确定点击范围
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.contentView]) {
        return NO;
    }
    return YES;
}

#pragma mark - public
/**
 *  显示属性选择视图
 *
 *  @param view 要在哪个视图中显示
 */
- (void)showInView:(UIView *)view {
    [view addSubview:self];
    __weak typeof(self) _weakSelf = self;
    self.contentView.frame = CGRectMake(15, kHeight, kWidth, kATTR_VIEW_HEIGHT);;
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        _weakSelf.contentView.frame = CGRectMake(15, kHeight - kATTR_VIEW_HEIGHT, kWidth, kATTR_VIEW_HEIGHT);
    }];
}

/**
 *  属性视图的消失
 */
- (void)removeView {
    __weak typeof(self) _weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.backgroundColor = [UIColor clearColor];
        _weakSelf.contentView.frame = CGRectMake(15, kHeight, kWidth, kATTR_VIEW_HEIGHT);
    } completion:^(BOOL finished) {
        [_weakSelf removeFromSuperview];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
    //    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZP_PayModel * model = _dataArray[indexPath.row];
    PayMoneyViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PayMoneyViewCell"];
    //    cell.backgroundColor = [UIColor yellowColor];
    cell.PayBut.tag = indexPath.row;
    [cell.PayImageView sd_setImageWithURL:[NSURL URLWithString:model.logourl]placeholderImage:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.PayBut addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.PayLabel.text = model.payname;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //    return CGFLOAT_MIN;
    return 5.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (void)btnClick:(UIButton *)btn {
    if (!btn.selected) {
        btn.selected = !btn.selected;
        if (btn.selected) {
            for (int i = 0; i < self.dataArray.count; i ++) {
                PayMoneyViewCell * cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
                if (i == btn.tag) {}
                else{cell.PayBut.selected = NO;}
            }
        }
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, ZP_Width, self.contentView.frame.size.height - 100 - 60) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"PayMoneyViewCell" bundle:nil] forCellReuseIdentifier:@"PayMoneyViewCell"];
    }
    return _tableView;
}

//- (void)setAmountLabel:(UILabel *)AmountLabel {
//
//    //    _AmountLabel.text = [NSString stringWithFormat:@"NT%.2f",AmountLabel.text.floatValue];
//}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [_tableView reloadData];
    NSLog(@"%ld",(unsigned long)self.dataArray.count);
}
@end
