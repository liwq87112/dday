//
//  ZPHomeHeadrView.m
//  merchants
//
//  Created by Summer on 2017/9/18.
//  Copyright © 2017年 PENG.ZHANG. All rights reserved.
//

#import "ZPHomeHeadrView.h"
#import "ZPLoopView.h"
//#import "ZPHomeHeadrCell.h"
#import "ZPHomeHeaderLayout.h"
#define JFSCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width//屏幕宽度
#define JFSCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height//屏幕高度

static NSString * ID = @"homeCollectionViewCell";

@interface ZPHomeHeadrView ()


/** 菜单按钮图片  */
@property (nonatomic, strong) NSMutableArray * buttonIconMutableArray;

@end
@implementation ZPHomeHeadrView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //   添加图片轮播器
        CGFloat loopViewH = 200;
        NSArray * imageArray = @[@"banner_jiazai.jpg",@"banner_jiazai.jpg",@"banner_jiazai.jpg"];
        ZPLoopView * loopView = [[ZPLoopView alloc] initWithImageArray:imageArray];
        loopView.frame = CGRectMake(0, 0, JFSCREEN_WIDTH, loopViewH);
        [self addSubview:loopView];
        
        //      这个是写给首页的8按钮
        //添加横向滑动的UICollectionView
        //        CGFloat collectionViewY = loopViewH;
        //        CGFloat collectionViewH = JFSCREEN_WIDTH / 2;
        //        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, collectionViewY, JFSCREEN_WIDTH, collectionViewH) collectionViewLayout:[[MYIHomeHeaderLayout alloc] init]];
        //        [collectionView registerClass:[MYIHomeHeaderCollectionViewCell class] forCellWithReuseIdentifier:ID];
        //        collectionView.backgroundColor = [UIColor whiteColor];
        //        collectionView.dataSource = self;
        //        collectionView.delegate = self;
        //        [self addSubview:collectionView];
        
        //        self.buttonIconMutableArray = [[NSMutableArray alloc] init];
        
        //        //横向滑动菜单按钮图片名字
        //        for (int i = 1; i < 7; i ++) {
        //            NSString *name = [NSString stringWithFormat:@"button_%d",i];
        //
        //            [self.buttonIconMutableArray addObject:name];
        //        }
    }
    return self;
}

#pragma mark UICollectionViewDataSource 数据源方法
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return 8;
//}

//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    ZPHomeHeadrCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//        cell.imageName = self.buttonIconMutableArray[indexPath.item % self.buttonIconMutableArray.count];
//    cell.title = @"按钮";
//    return cell;
//}

@end
