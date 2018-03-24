//
//  CIImage+Extension.h
//  
//
//  Created by 小树普惠 on 2017/10/10.
//
//

#import <CoreImage/CoreImage.h>
#import <UIKit/UIKit.h>
@interface CIImage (Extension)
- (UIImage *)createNonInterpolatedWithSize:(CGFloat)size;
@end
