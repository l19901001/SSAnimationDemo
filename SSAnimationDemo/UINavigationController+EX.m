//
//  UINavigationController+EX.m
//  SSAnimationDemo
//
//  Created by lss on 2015/6/5.
//  Copyright © 2015年 lss. All rights reserved.
//

#import "UINavigationController+EX.h"

NSString *const kFADE = @"fade";
NSString *const kPUSH = @"push";
NSString *const kMOVEIN = @"moveIn";
NSString *const kREVEAL = @"reveal";
NSString *const kOGLFLIP = @"oglFlip";
NSString *const kCUBE = @"cube";
NSString *const kSUCKEFFECT = @"suckEffect";
NSString *const kRIPPLEEFFECT = @"rippleEffect";
NSString *const kPAGECURL = @"pageCurl";
NSString *const kPAGEUNCURL = @"pageUnCurl";
NSString *const kCAMERAIRISHOLLOWOPEN = @"cameraIrisHollowOpen";
NSString *const kCAMERAIRISHOLLOWCLOSE = @"cameraIrisHollowClose";

@implementation UINavigationController (EX)

-(void)pushViewController:(UIViewController *)viewController animation:(NSString *)type animationDirection:(AnimationDirection)animationDirection
{
    if(type == nil){
        [self pushViewController:viewController animated:YES];
    }
    else{
        CATransition *transition = [CATransition animation];
        transition.type = type;
        switch (animationDirection) {
            case AnimationDirectionUP:
                transition.subtype = kCATransitionFromTop;
                break;
            case AnimationDirectionDoen:
                transition.subtype = kCATransitionFromBottom;
                break;
            case AnimationDirectionLeft:
                transition.subtype = kCATransitionFromLeft;
                break;
            case AnimationDirectionRight:
                transition.subtype = kCATransitionFromRight;
                break;
                
            default:
                break;
        }
        
        transition.duration = 0.5f;
//        transition.fillMode = kCAFillModeForwards;
//        transition.removedOnCompletion = NO;
        [self.view.layer addAnimation:transition forKey:@""];
        [self pushViewController:viewController animated:NO];
    }
}

-(void)popViewController:(UIViewController *)viewController animation:(NSString *)type animationDirection:(AnimationDirection)animationDirection
{
    if(type == nil){
        [self popViewControllerAnimated:YES];
    }
    else{
        CATransition *transition = [CATransition animation];
        transition.type = type;
        switch (animationDirection) {
            case AnimationDirectionUP:
                transition.subtype = kCATransitionFromTop;
                break;
            case AnimationDirectionDoen:
                transition.subtype = kCATransitionFromBottom;
                break;
            case AnimationDirectionLeft:
                transition.subtype = kCATransitionFromLeft;
                break;
            case AnimationDirectionRight:
                transition.subtype = kCATransitionFromRight;
                break;
                
            default:
                break;
        }
        
        transition.duration = 0.5;
//        transition.fillMode = kCAFillModeForwards;
//        transition.removedOnCompletion = NO;
        [self.view.layer addAnimation:transition forKey:@""];
        [self popViewControllerAnimated:NO];
    }
}


@end
