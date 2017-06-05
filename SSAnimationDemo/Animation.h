//
//  Animation.h
//  SSAnimationDemo
//
//  Created by lss on 2015/5/31.
//  Copyright © 2015年 lss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Animation : NSObject

+(CABasicAnimation *)basicAnimation:(NSString *)path;

+(CAKeyframeAnimation *)keyFrameAnimation:(NSString *)path;

@end
