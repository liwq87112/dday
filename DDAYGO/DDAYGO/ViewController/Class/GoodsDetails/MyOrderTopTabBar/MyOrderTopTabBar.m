//
//  MyOrderTopTabBar.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/14.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "MyOrderTopTabBar.h"
#import "TabButton.h"
#import "global.h"

#define bottomViewW 6.0

@interface MyOrderTopTabBar()

@property(nonatomic,weak) TabButton * lastBtn;//记录上一个按钮
@property(nonatomic,weak) UIView * bottomView;//记录底部指示的标示条
@property(nonatomic,assign)CGFloat btnW;//记录按钮的宽度
@property(nonatomic,assign)CGFloat btnH;//记录按钮的高度

@end

@implementation MyOrderTopTabBar

+ (instancetype)tabbar {
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView* bottomView = [[UIView alloc] init];
        bottomView.backgroundColor = color(255.0,0.0,0.0,1.0);
        self.bottomView = bottomView;
        [self addSubview:bottomView];
    }
    return self;
}

/**
 使用字符数组初始化
 */

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        for(NSString* name in array){
            [self AddTarBarBtn:name];
        }
    }
    return self;
}

/**
 添加顶部标题项的名字
 */
- (void)AddTarBarBtn:(NSString *)name {
    TabButton * btn = [TabButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:name forState:UIControlStateNormal];
    [btn setTitleColor:color(33.0,33,33.0,1.0) forState:UIControlStateNormal];
    [btn setTitleColor:color(255.0,0.0,0.0,1.0) forState:UIControlStateSelected];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:[global pxTopt:30.0]]];
    [btn addTarget:self action:@selector(TabBtnClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn];
    [btn setTag:self.subviews.count-2];
    //ZPLog(@"按钮tag == %ld",self.subviews.count - 2);
    if(2 == self.subviews.count){
        [self TabBtnClick:btn];
    }
}

/**
 计算字view的frame
 */
- (void)layoutSubviews {
    NSInteger btnCount = self.subviews.count;
    CGFloat btnW = self.frame.size.width/(btnCount - 1);
    CGFloat btnH = self.frame.size.height;
    self.btnW = btnW;
    self.btnH = btnH;
    for(int i=0;i<btnCount;i++){
        if ([self.subviews[i] isKindOfClass:[TabButton class]]) {
            TabButton *btn = self.subviews[i];
            btn.frame = CGRectMake((i-1)*btnW, 0, btnW, btnH);
        }else{
            UIView* view = self.subviews[i];
            view.frame = CGRectMake(0, btnH - [global pxTopt:bottomViewW], btnW,[global pxTopt:bottomViewW]);
        }
    }
    //ZPLog(@"按钮数量 == %ld",self.subviews.count);
}

/**
 监听tabbar的点击
 */
- (void)TabBtnClick:(TabButton *)sender {
    if(_lastBtn != nil) {
        _lastBtn.selected = NO;
    }
    sender.selected = YES;
    _lastBtn = sender;
    //底部指示view的动画
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomView.frame = CGRectMake(sender.tag*self.btnW, self.btnH - [global pxTopt:bottomViewW], self.btnW, [global pxTopt:bottomViewW]);
    }];
    if([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)]){//判断代理有没有实现这个函数了
        [_delegate tabBar:self didSelectIndex:sender.tag];
    }
}


@end
