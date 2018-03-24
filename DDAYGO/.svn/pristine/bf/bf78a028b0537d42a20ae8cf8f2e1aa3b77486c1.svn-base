//
//  ZPWeakTimerTargetObject.m
//  merchants
//
//  Created by Login on 2017/9/19.
//  Copyright © 2017年 PENG.ZHANG. All rights reserved.
//

#import "ZPWeakTimerTargetObject.h"

@interface ZPWeakTimerTargetObject ()
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;

@end
@implementation ZPWeakTimerTargetObject

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    
    //   创建当前类对象
    ZPWeakTimerTargetObject *object = [[ZPWeakTimerTargetObject alloc] init];
    object.target = aTarget;
    object.selector = aSelector;
    return [NSTimer scheduledTimerWithTimeInterval:ti target:object selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
}

- (void)fire:(id)obj {
    
    [self.target performSelector:self.selector withObject:obj];
}

@end
