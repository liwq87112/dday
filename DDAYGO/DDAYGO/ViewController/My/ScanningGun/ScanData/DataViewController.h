//
//  DataViewController.h
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/11.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

/** 接收扫描的二维码信息 */
@property (nonatomic, copy) NSString * jump_HeadURL;
@property (nonatomic, copy) NSString * jump_URL;
/** 接收扫描的条形码信息 */
//@property (nonatomic, copy) NSString * jump_bar_code;


@property (nonatomic, strong) NSString * Oid;
@property (nonatomic, strong) NSString * Oname;
@end
