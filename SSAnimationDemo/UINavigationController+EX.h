//
//  UINavigationController+EX.h
//  SSAnimationDemo
//
//  Created by lss on 2015/6/5.
//  Copyright © 2015年 lss. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AnimationDirection)
{
    AnimationDirectionNone,
    AnimationDirectionUP,
    AnimationDirectionDoen,
    AnimationDirectionLeft,
    AnimationDirectionRight
};

UIKIT_EXTERN NSString *const kFADE;//淡化过渡
UIKIT_EXTERN NSString *const kPUSH;//新视图把旧视图推出去
UIKIT_EXTERN NSString *const kMOVEIN;//新视图移到旧视图上面
UIKIT_EXTERN NSString *const kREVEAL;//将旧视图移开,显示下面的新视图
UIKIT_EXTERN NSString *const kOGLFLIP; //上下左右翻转效果
UIKIT_EXTERN NSString *const kCUBE; //立方体翻滚效果
UIKIT_EXTERN NSString *const kSUCKEFFECT;//收缩效果，如一块布被抽走
UIKIT_EXTERN NSString *const kRIPPLEEFFECT;//滴水效果
UIKIT_EXTERN NSString *const kPAGECURL;//向上翻页效果
UIKIT_EXTERN NSString *const kPAGEUNCURL;//向下翻页效果
UIKIT_EXTERN NSString *const kCAMERAIRISHOLLOWOPEN;//相机镜头打开效果
UIKIT_EXTERN NSString *const kCAMERAIRISHOLLOWCLOSE;//相机镜头关上效果

@interface UINavigationController (EX)

-(void)pushViewController:(UIViewController *)viewController animation:(NSString *)type animationDirection:(AnimationDirection)animationDirection;

-(void)popViewController:(UIViewController *)viewController animation:(NSString *)type animationDirection:(AnimationDirection)animationDirection;;

@end
