//
//  MyViewController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/9/7.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, DDPopKind)
{
    DDFromChildVC           = 0,
    DDFromDataVC            = 1
};
#import "PromptBoxView.h"
@interface MyViewController : PromptBoxView
@property (weak, nonatomic) IBOutlet UIView * BackgroundView;

@property (strong, nonatomic) IBOutlet UILabel * NameLabel; // 名字
@property (strong, nonatomic) IBOutlet UILabel * CollectionLabel; // 收藏
//@property (weak, nonatomic) IBOutlet UILabel *TrackingStoreLabel; // 关注店铺
@property (strong, nonatomic) IBOutlet UILabel * BrowseLabel; // 足迹
@property (weak, nonatomic) IBOutlet UILabel * RequestStatusLabel; // 申请状态
@property (weak, nonatomic) IBOutlet UIButton * ssdkBut;
@property (weak, nonatomic) IBOutlet UIButton * headImageBut;
@property (weak, nonatomic) IBOutlet UILabel * kuohaoLabel1;
@property (weak, nonatomic) IBOutlet UILabel * kuohaoLabel2;

@property (nonatomic ,assign) BOOL hasLogin;
@property (nonatomic ,assign) BOOL hasRemind;
@property (nonatomic ,assign) DDPopKind popKind;
@property (nonatomic, strong) NSNumber * RequestStatusStr;
+ (MyViewController *)sharedInstanceTool;

- (void)autoLogin:(void (^)(id obj))success;
- (NSString *)getMonetarySymbol;



@end
