//
//  QCodeController.m
//  DDAYGO
//
//  Created by 小树普惠 on 2017/10/10.
//  Copyright © 2017年 lwq. All rights reserved.
//

#import "QCodeController.h"
#import "QRCodeReaderView.h"
#import "PayViewController.h"
#import "DataViewController.h"
#import <AVFoundation/AVFoundation.h>
//#import <AudioToolbox/AudioToolbox.h>
//#import "PayViewController.h"
#import "PrefixHeader.pch"
//#define DeviceMaxHeight ([UIScreen mainScreen].bounds.size.height)
//#define DeviceMaxWidth ([UIScreen mainScreen].bounds.size.width)
//#define widthRate DeviceMaxWidth/320
//#define IOS8 ([[UIDevice currentDevice].systemVersion intValue] >= 8 ? YES : NO)
@interface QCodeController ()<AVCaptureMetadataOutputObjectsDelegate>
//{
//    QRCodeReaderView * readview;//二维码扫描对象
//    
//    BOOL isFirst;//第一次进入该页面
//    BOOL isPush;//跳转到下一级页面
//}

//@property (strong, nonatomic) CIDetector *detector;
/** 会话对象 */
@property (nonatomic, strong) AVCaptureSession * session;
/** 图层类 */
@property (nonatomic, strong) AVCaptureVideoPreviewLayer * previewLayer;
@property (nonatomic, strong) QRCodeReaderView * scanningView;
@property (nonatomic, strong) UIButton * right_Button;

@end

@implementation QCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = MyLocal(@"scanning");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: ZP_textWite}];
    [self.navigationController.navigationBar setBarTintColor:ZP_NavigationCorlor];
    [self InitScan];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(adjustStatusBar:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

#pragma mark 初始化扫描
- (void)InitScan {
    //    创建扫描边框
    // 创建扫描边框
    self.scanningView = [[QRCodeReaderView alloc] initWithFrame:self.view.frame outsideViewLayer:self.view.layer];
    [self.view addSubview:self.scanningView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //  二维码扫描
    [self setupScanningQRCode];
}

#pragma mark - - - 二维码扫描
- (void)setupScanningQRCode {
    // 1、 获取摄像设备
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // 2、 创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    
    // 3、 创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc] init];
    
    // 4、设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // 设置扫描范围(每一个取值0～1，以屏幕右上角为坐标原点)
    output.rectOfInterest = CGRectMake(0.15, 0.24, 0.7, 0.52);
    
    // 5、 初始化链接对象（会话对象）
    self.session = [[AVCaptureSession alloc] init];
    //高质量采集率
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    
    // 5.1 添加会话输入
    if (input == nil) {
        [SVProgressHUD showInfoWithStatus:MyLocal(@"Camera unavailable")];
        //        [self.navigationController popViewControllerAnimated:YES];
    }else {
        [_session addInput:input];
        // 5.2 添加会话输出
        [_session addOutput:output];
        // 6、设置输出数据类型，需要将元数据输出添加到会话后，才能指定元数据类型，否则会报错
        // 设置扫码支持的编码格式(如下设置条形码和二维码兼容)
        output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code,  AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
        
        // 7、实例化预览图层, 传递_session是为了告诉图层将来显示什么内容
        self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
        _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        _previewLayer.frame = self.view.layer.bounds;
        
        // 8、将图层插入当前视图
        [self.view.layer insertSublayer:_previewLayer atIndex:0];
        
        // 9、启动会话
        [_session startRunning];
    }
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    // 会频繁的扫描，调用代理方法
    // 1. 如果扫描完成，停止会话
    
    // 3. 设置界面显示扫描结果
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject * obj = metadataObjects[0];
        NSLog(@"metadataObjects = %@", metadataObjects);
        //  提示：如果需要对url或者名片等信息进行扫描，可以在此进行扩展！
        if ([obj.stringValue containsString:@"ddaygo"]) {
            [self.session stopRunning];
            // 2. 删除预览图层
            [self.previewLayer removeFromSuperlayer];
            PayViewController * pay = [[PayViewController alloc]init];
            NSArray * arr = [obj.stringValue componentsSeparatedByString:@","];
            pay.Oid = arr[1];
            pay.Oname = arr[2];
            [self.navigationController pushViewController:pay animated:YES];
        } else {
            [SVProgressHUD showErrorWithStatus:MyLocal(@"Error in qr code.")];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

// 移除定时器
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.scanningView removeTimer];
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
