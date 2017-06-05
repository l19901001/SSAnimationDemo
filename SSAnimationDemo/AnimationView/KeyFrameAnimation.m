//
//  KeyFrameAnimation.m
//  SSAnimationDemo
//
//  Created by lss on 2015/5/31.
//  Copyright © 2015年 lss. All rights reserved.
//

#import "KeyFrameAnimation.h"
#import "Animation.h"

@interface KeyFrameAnimation ()

@property (nonatomic, weak) UIView *aniView;

@end

@implementation KeyFrameAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass([self class]);
    
    UIView *aniView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    CGPoint center = CGPointMake(self.view.center.x, self.view.center.y+100);
    aniView.center = center;
    aniView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:aniView];
    _aniView = aniView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CAKeyframeAnimation *animation = [Animation keyFrameAnimation:@"transform.scale"];
    [_aniView.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
