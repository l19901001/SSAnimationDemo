//
//  Animation.m
//  SSAnimationDemo
//
//  Created by lss on 2015/5/31.
//  Copyright © 2015年 lss. All rights reserved.
//

#import "Animation.h"

@implementation Animation

+(CABasicAnimation *)basicAnimation:(NSString *)path
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = path;
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    animation.duration = 0.5;
//    animation.repeatCount = MAXFLOAT;

    if ([path hasPrefix:@"position"]) {
        CGFloat x = arc4random()%320;
        CGFloat y = 320 + arc4random()%(568-320);
        animation.toValue = [NSValue valueWithCGPoint:CGPointMake(x, y)];
    }
    
    if ([path hasPrefix:@"transform"]) {
        [self transform:animation path:path];
    }

    return animation;
}

+(CAKeyframeAnimation *)keyFrameAnimation:(NSString *)path
{
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.keyPath = path;
    keyFrameAnimation.duration = 2.0;
    
    //轨迹动画
//    CGMutablePathRef pathRef = CGPathCreateMutable();
//    CGPathAddEllipseInRect(pathRef, NULL, CGRectMake(50, 320, 100, 100));
//    keyFrameAnimation.path = pathRef;
//    CGPathRelease(pathRef);
    
    NSValue *value1 = @(0.2);
    NSValue *value2 = @(0.4);
    NSValue *value3 = @(1.0);
    NSValue *value4 = @(0.8);
    NSValue *value5 = @(0.6);
    
    keyFrameAnimation.values = @[value1, value2, value3, value4, value5];
    keyFrameAnimation.keyTimes = @[@(0.25), @(0.3), @(0.35), @(0.4), @(1)];
    
    
    return keyFrameAnimation;
}

/**CABasicAnimation transform*/
+(void)transform:(CABasicAnimation *)anima path:(NSString *)path
{
    NSValue *value = nil;
    NSValue *toValue = nil;
//    value = @(0);
    if([path isEqualToString:@"transform.rotation.x"]){
        toValue = @(M_PI);
    }
    else if([path isEqualToString:@"transform.rotation.y"]){
        toValue = @(M_PI);
    }
    else if([path isEqualToString:@"transform.rotation"]){
        toValue = @(M_PI*2);
    }
    else if([path isEqualToString:@"transform.scale.x"]){
        toValue = @(1.5);
    }
    else if([path isEqualToString:@"transform.scale.y"]){
        toValue = @(1.5);
    }
    else if([path isEqualToString:@"transform.scale"]){
        toValue = @(2.5);
    }
    else if([path isEqualToString:@"transform.translation.x"]){
        toValue = @(100);
    }
    else if([path isEqualToString:@"transform.translation.y"]){
        toValue = @(100);
    }
    else if([path isEqualToString:@"transform.translation"]){
        toValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    }
    
    anima.fromValue = value;
    anima.toValue = toValue;
}

@end
