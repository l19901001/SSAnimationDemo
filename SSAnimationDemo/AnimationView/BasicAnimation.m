//
//  BasicAnimation.m
//  SSAnimationDemo
//
//  Created by lss on 2015/5/31.
//  Copyright © 2015年 lss. All rights reserved.
//

#import "BasicAnimation.h"
#import "Animation.h"

@interface BasicAnimation ()

@property (nonatomic, weak) UIView *aniView;

@end

@implementation BasicAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass([self class]);
    NSArray *array = @[@"rotation.x", @"rotation.y", @"rotation",
                       @"scale.x", @"scale.y", @"scale", @"position",
                       @"translation.x", @"translation.y", @"translation"];
    CGFloat offsetx = 5;
    CGFloat offsety = 5;
    for (int i = 0; i < array.count; i++) {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        [but setTitle:array[i] forState:UIControlStateNormal];
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
}

-(void)startAnimation:(UIButton *)but
{
    NSString *keyPath = nil;
    if([but.titleLabel.text isEqualToString:@"position"]){
        keyPath = @"position";
    }
    else if([but.titleLabel.text isEqualToString:@"backgroundColor"]){
        keyPath = @"backgroundColor";
    }
    else{
        keyPath = [NSString stringWithFormat:@"transform.%@", but.titleLabel.text];
    }
    
    CABasicAnimation *animation = [Animation basicAnimation:keyPath];
    [_aniView.layer addAnimation:animation forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
