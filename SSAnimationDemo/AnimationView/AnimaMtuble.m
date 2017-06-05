//
//  AnimaMtuble.m
//  SSAnimationDemo
//
//  Created by lss on 2015/5/31.
//  Copyright © 2015年 lss. All rights reserved.
//

#import "AnimaMtuble.h"

@interface AnimaMtuble ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, strong) NSArray *array;

@property (nonatomic, assign) NSInteger selectIndex;

@end

@implementation AnimaMtuble

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass([self class]);
    
    _array = @[@{@"borderWidth":@(1.f), @"borderColor":[UIColor redColor], @"backgroundColor":
                [UIColor yellowColor]},
               @{@"borderWidth":@(3.f), @"borderColor":[UIColor grayColor], @"backgroundColor":[UIColor greenColor]},
               @{@"borderWidth":@(5.f), @"borderColor":[UIColor blackColor], @"backgroundColor":[UIColor blueColor]},
               @{@"borderWidth":@(7.f), @"borderColor":[UIColor orangeColor], @"backgroundColor":[UIColor purpleColor]}];
    
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = CGRectMake(0, 0, 100, 100);
    _shapeLayer.position = self.view.center;
    _shapeLayer.backgroundColor = [UIColor redColor].CGColor;
    _shapeLayer.borderWidth = 2.f;
    [self.view.layer addSublayer:_shapeLayer];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSInteger index = arc4random()%(_array.count-1);
    if(index != _selectIndex){
        NSDictionary *dic = _array[index];
        UIColor *bgC = dic[@"backgroundColor"];
        UIColor *borC = dic[@"borderColor"];
        CGFloat w = [dic[@"borderWidth"] floatValue];
        [CATransaction begin];
        [CATransaction setAnimationDuration:0.5];
        _shapeLayer.backgroundColor = bgC.CGColor;
        _shapeLayer.borderWidth = w;
        _shapeLayer.borderColor = borC.CGColor;
        [CATransaction commit];
        _selectIndex = index;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
