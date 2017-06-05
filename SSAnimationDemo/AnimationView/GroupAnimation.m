//
//  GroupAnimation.m
//  SSAnimationDemo
//
//  Created by lss on 2015/5/31.
//  Copyright © 2015年 lss. All rights reserved.
//

#import "GroupAnimation.h"

#define durations 3.0

@interface GroupAnimation ()

@property (nonatomic, strong) UIView *testView;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation GroupAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass([self class]);
    
    _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    CGPoint cent = CGPointMake(self.view.center.x, 100);
    _testView.center = cent;
    _testView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_testView];
    
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = _testView.bounds;
    _shapeLayer.strokeEnd = 0;
    _shapeLayer.fillColor = self.view.backgroundColor.CGColor;
    _shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    _shapeLayer.lineCap = kCALineCapRound;
    _shapeLayer.lineJoin = kCALineJoinRound;
    _shapeLayer.lineWidth = 2.0;
    _shapeLayer.fillRule = kCAFillRuleEvenOdd;
    [_testView.layer addSublayer:_shapeLayer];
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathAddEllipseInRect(pathRef, NULL, _testView.bounds);
    _shapeLayer.path = pathRef;
    CGPathRelease(pathRef);
    
    UIButton *statr = [UIButton buttonWithType:UIButtonTypeCustom];
    [statr setTitle:@"开始" forState:UIControlStateNormal];
    [statr setTitle:@"停止" forState:UIControlStateSelected];
    statr.backgroundColor = [UIColor orangeColor];
    [statr sizeToFit];
    statr.center = self.view.center;
    [self.view addSubview:statr];
    
    [statr addTarget:self action:@selector(startAnima:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)startAnima:(id)sender
{
    UIButton *but = (UIButton *)sender;
    but.selected = !but.isSelected;
    if(but.selected){
        CABasicAnimation *rotationAnima = [CABasicAnimation animation];
        rotationAnima.keyPath = @"transform.rotation";
        rotationAnima.toValue = @(M_PI*2);
        rotationAnima.repeatCount = MAXFLOAT;
        rotationAnima.duration = durations;
        [_testView.layer addAnimation:rotationAnima forKey:@"rotationAnima"];
        
        CABasicAnimation *basicAnima1 = [CABasicAnimation animation];
        basicAnima1.keyPath = @"strokeStart";
        basicAnima1.duration = durations/1.5f;
        basicAnima1.toValue = @(0.25);
        
        CABasicAnimation *basicAnima2 = [CABasicAnimation animation];
        basicAnima2.keyPath = @"strokeEnd";
        basicAnima2.duration = durations/1.5f;
        basicAnima2.toValue = @(1.f);
        
        CABasicAnimation *basicAnima3 = [CABasicAnimation animation];
        basicAnima3.keyPath = @"strokeStart";
        basicAnima3.beginTime = durations/1.5f;
        basicAnima3.duration = durations/3.0;
        basicAnima3.fromValue = @(0.25);
        basicAnima3.toValue = @(1.f);
        
        CABasicAnimation *basicAnima4 = [CABasicAnimation animation];
        basicAnima4.keyPath = @"strokeEnd";
        basicAnima4.beginTime = durations/1.5f;
        basicAnima4.duration = durations/3.0;
        basicAnima4.fromValue = @(1.f);
        basicAnima4.toValue = @(1.f);
        
        CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
        groupAnima.animations = @[basicAnima1, basicAnima2, basicAnima3, basicAnima4];
        groupAnima.fillMode = kCAFillModeForwards;
        groupAnima.removedOnCompletion = NO;
        groupAnima.duration = durations;
        groupAnima.repeatCount = MAXFLOAT;
        groupAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [_shapeLayer addAnimation:groupAnima forKey:nil];
    }else{
        [self stopAnimation];
    }
}

-(void)stopAnimation
{
    [_testView.layer removeAllAnimations];
    [_shapeLayer removeAllAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
