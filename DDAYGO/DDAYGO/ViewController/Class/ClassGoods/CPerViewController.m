//
//  CPerViewController.m
//  DDAYGO
//
//  Created by 小树普惠 on 2018/1/27.
//  Copyright © 2018年 lwq. All rights reserved.
//

#import "CPerViewController.h"
#import "CPCollectionViewCell.h"
#import "PrefixHeader.pch"
#import "ZP_ClassViewTool.h"
#import "ClassificationViewController.h"
#import "ZP_ClassGoodsModel.h"
#import "CPCollectionViewController.h"
@interface CPerViewController ()<UIScrollViewDelegate>
{
    NSInteger  _indexTag; // 价格筛选
    UIButton * button;
}
@property (nonatomic, strong) NSArray * titleArray;
@property (nonatomic, strong) UIScrollView * contentScrollView;
@property (nonatomic, strong) UIView * topView;
@property (nonatomic, strong) UIView * line;
@end

@implementation CPerViewController

- (UIScrollView *)contentScrollView{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 37, ZP_Width, ZP_height - 37)];
        _contentScrollView.contentSize = CGSizeMake(ZP_Width * 4, 0);
        _contentScrollView.pagingEnabled  = YES;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.showsVerticalScrollIndicator = NO;
        _contentScrollView.delegate = self;
        _contentScrollView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_contentScrollView];
        
        
    }
    return _contentScrollView;
}
// 设置contentScrollView不能左右滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    scrollView.bounces = (scrollView.contentOffset.y <= 10) ? NO : YES;
}

-(UIView *)topView {
    if (!_topView) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ZP_Width, 37)];
        line.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:line];
        _topView = line;
    }
    return _topView;
}

-(UIView *)line {
    if (!_line) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 34, ZP_Width / 4, 1.4)];
        line.backgroundColor = [UIColor colorWithHexString:@"#e74940"];
        [self.topView addSubview:line];
        _line = line;
    }
    return _line;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _titleString;
    _priceStrTag = @"asc";
    [self.navigationController.navigationBar setBarTintColor:ZP_NavigationCorlor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:ZP_textWite}];   // 更改导航栏字体颜色
    [self initView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(adjustStatusBar:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

- (void)initView {
    _titleArray =  @[MyLocal(@"Acquiescence"),MyLocal(@"Sales Volume"),MyLocal(@"Latest"),MyLocal(@"Price")];
    for (NSInteger i = 0; i<_titleArray.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*(ZP_Width/4), 0, ZP_Width/4, 34);
        
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = ZP_titleFont;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
#pragma mark --  默认图片
        if (i == 3) {
            //          默认图片
            [button setImage:[UIImage imageNamed:@"icon_shop_classification_01"] forState:UIControlStateNormal];
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -button.imageView.bounds.size.width, 0, button.imageView.bounds.size.width)];
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, button.titleLabel.bounds.size.width, 0, - button.titleLabel.bounds.size.width)];
        }
        [self.topView addSubview:button];
    }
    self.line.x = 0;
    for (NSInteger j = 0; j <_titleArray.count; j++) {
        CPCollectionViewController * vc = [[CPCollectionViewController alloc]init];
        vc.fatherId = self.fatherId;
        vc.nameStr = self.nameStr;
        vc.titleString = self.titleString;
        vc.keyword = self.keyword;
        vc.priceStrTag = self.priceStrTag;
        if (self.type >9) {
            vc.type = self.type*10 + j; //为了和其他界面作区分，所以乘10
        } else {
            vc.type = j;
        }
        vc.view.tag = j;
        [self addChildViewController:vc];
        [self.contentScrollView addSubview:vc.view];
        vc.view.frame = CGRectMake(j*ZP_Width, 0, ZP_Width, self.contentScrollView.height);
    }
    self.contentScrollView.contentOffset = CGPointMake(0, 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger tag = scrollView.contentOffset.x/ZP_Width;
    _indexTag = tag;
    self.contentScrollView.contentOffset = CGPointMake(tag*ZP_Width, 0);
    UIViewController * vcs = self.childViewControllers[tag];
    vcs.view.frame = CGRectMake(tag*ZP_Width, 0, ZP_Width, self.contentScrollView.frame.size.height);
    [UIView animateWithDuration:0.1 animations:^{
        self.line.x = (ZP_Width/4)*tag;
    }];
}

- (void)btnClick:(UIButton *)button {
    _indexTag = button.tag ;
    [UIView animateWithDuration:0.1 animations:^{
        self.line.x = (ZP_Width/4)*button.tag;
    }];
    self.contentScrollView.contentOffset = CGPointMake(button.tag*ZP_Width, 0);
    
    if (button.tag == 3) {
        button.selected = !button.selected;
        if (button.selected) {
#pragma mark --  选中
            [button setImage:[UIImage imageNamed:@"icon_shop_classification_03"] forState:UIControlStateNormal];
            _priceStrTag = @"desc";
        }else{
#pragma mark -- 取消选中
            [button setImage:[UIImage imageNamed:@"icon_shop_classification_02"] forState:UIControlStateNormal];
            _priceStrTag = @"asc";
        }
        
        for (CPCollectionViewController * vcs in self.childViewControllers) {
            if (vcs.view.tag == button.tag) {
                vcs.priceStrTag = _priceStrTag;
                [vcs allData];
            }
        }
    }
}

// 热点被接入，子类重写
- (void)adjustStatusBar:(NSNotification *)notification {
    NSValue * rectValue = [notification.userInfo objectForKey:UIApplicationStatusBarFrameUserInfoKey];
    CGRect statusRect = [rectValue CGRectValue];
    CGFloat height = statusRect.size.height;
    if (height > 20) {
        appD.window.frame = CGRectMake(0, 0, ZP_Width, ZP_height);
    }else{
        appD.window.frame = CGRectMake(0, 0, ZP_Width, ZP_height);
    }
}
@end
