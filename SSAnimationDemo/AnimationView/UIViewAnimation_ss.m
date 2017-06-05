//
//  UIViewAnimation.m
//  SSAnimationDemo
//
//  Created by lss on 2015/5/31.
//  Copyright © 2015年 lss. All rights reserved.
//

#import "UIViewAnimation_ss.h"

#define durations 0.8

@interface UIViewAnimation_ss ()

@property (nonatomic, weak) UIView *aniView;

@property (nonatomic, weak) UIView *someView;
@property (nonatomic, weak) UIView *view1;
@property (nonatomic, weak) UIView *view2;


@end

@implementation UIViewAnimation_ss

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass([self class]);
    
    CGFloat offsetx = 5;
    CGFloat offsety = 5;
    for (int i = 0; i < 8; i++) {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.tag = i+1;
        NSString *title = [NSString stringWithFormat:@"动画-%d", i+1];
        [but setTitle:title forState:UIControlStateNormal];
        [but setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [but setBackgroundColor:[UIColor yellowColor]];
        [but addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
        [but sizeToFit];
        CGRect rect= CGRectMake(0, 64, but.bounds.size.width, 44);
        but.frame = CGRectOffset(rect, offsetx, offsety);
        
        if(CGRectGetMaxX(but.frame)>self.view.bounds.size.width){
            offsety = CGRectGetMaxY(but.frame)-59;
            but.frame = CGRectOffset(rect, 5, offsety);
        }
        offsetx = CGRectGetMaxX(but.frame)+5;
        [self.view addSubview:but];
    }
    
    UIView *aniView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    CGPoint center = CGPointMake(self.view.center.x, self.view.center.y+100);
    aniView.center = center;
    aniView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:aniView];
    _aniView = aniView;
    
    UIView *someView = [[UIView alloc] initWithFrame:CGRectMake(10, 200, 300, 100)];
    someView.backgroundColor = [UIColor redColor];
    [self.view addSubview:someView];
    _someView = someView;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 120, 100)];
    view1.backgroundColor = [UIColor grayColor];
    [someView addSubview:view1];
    _view1 = view1;
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(140, 0, 120, 100)];
    view2.backgroundColor = [UIColor orangeColor];
    [someView addSubview:view2];
    _view2 = view2;
}

-(void)startAnimation:(UIButton *)but
{
    switch (but.tag) {
        case 1:
            [self animation1];
            break;
        case 2:
            [self animation2];
            break;
        case 3:
            [self animation3];
            break;
        case 4:
            [self animation4];
            break;
        case 5:
            [self animation5];
            break;
        case 6:
            [self animation6];
            break;
        case 7:
            [self animation7];
            break;
        case 8:
            [self animation8];
            break;
            
        default:
            break;
    }
    
    
}

-(void)animation1
{
    [UIView animateWithDuration:durations animations:^{
        _aniView.center = [self getCenter];
    }];
}

-(void)animation2
{
    [UIView animateWithDuration:durations animations:^{
        _aniView.center = [self getCenter];
        _aniView.backgroundColor = [UIColor grayColor];
    } completion:^(BOOL finished) {
        _aniView.backgroundColor = [UIColor redColor];
    }];
}

-(void)animation3
{
    [UIView animateWithDuration:durations delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _aniView.center = [self getCenter];
        _aniView.backgroundColor = [UIColor grayColor];
    } completion:^(BOOL finished) {
        _aniView.backgroundColor = [UIColor redColor];
    }];
}

-(void)animation4
{
    [UIView animateKeyframesWithDuration:6.f delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1/3.f animations:^{
            _aniView.center = [self getCenter];
            _aniView.backgroundColor = [UIColor grayColor];
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.f relativeDuration:1/3.f animations:^{
            _aniView.center = [self getCenter];
            _aniView.backgroundColor = [UIColor yellowColor];
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.f relativeDuration:1/3.f animations:^{
            _aniView.center = [self getCenter];
            _aniView.backgroundColor = [UIColor greenColor];
        }];
        
    } completion:^(BOOL finished) {
        _aniView.backgroundColor = [UIColor redColor];
    }];
}

-(void)animation5
{
    [UIView animateWithDuration:durations delay:1 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        _aniView.center = [self getCenter];
        _aniView.backgroundColor = [UIColor grayColor];
    } completion:^(BOOL finished) {
        _aniView.backgroundColor = [UIColor redColor];
    }];
}

-(void)animation6
{
    [UIView transitionWithView:_someView duration:durations options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{

    } completion:^(BOOL finished) {
        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationDuration:durations];
        _view1.backgroundColor = [UIColor yellowColor];
        _view2.backgroundColor = [UIColor purpleColor];
        [UIView commitAnimations];
    }];

}

-(void)animation7
{
    [UIView transitionFromView:_view1 toView:_view2 duration:durations options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        
    }];
}

-(void)animation8
{
    [UIView performSystemAnimation:UISystemAnimationDelete onViews:_someView.subviews options:UIViewAnimationOptionTransitionNone animations:^{
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor greenColor];
        view.frame = CGRectMake(0, 0, 50, 50);
        [_someView addSubview:view];
    } completion:^(BOOL finished) {

    }];
}

-(CGPoint)getCenter
{
    CGFloat centerX = arc4random()%220;
    CGFloat centerY = 200 + arc4random()%400;
    CGPoint center = CGPointMake(centerX, centerY);
    return center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
