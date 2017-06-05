//
//  ViewController.m
//  SSAnimationDemo
//
//  Created by lss on 2015/5/30.
//  Copyright © 2015年 lss. All rights reserved.
//

#import "ViewController.h"
#import "SSCollectionView.h"


@interface ViewController () 

@property (nonatomic, strong) SSCollectionView *ss_collectionView;
@property (nonatomic, strong) NSArray *viewControllers;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"动画首页";
    _viewControllers = @[@"BasicAnimation", @"KeyFrameAnimation",
                         @"Transion", @"AnimaMtuble", @"UIViewAnimation_ss",
                         @"GroupAnimation"];
    _ss_collectionView = [[SSCollectionView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_ss_collectionView];
    
    __weak typeof(self) wself = self;
    _ss_collectionView.selectBlock = ^(NSDictionary *dic){
        [wself pushAnimationViewWithDic:dic];
    };
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

-(void)pushAnimationViewWithDic:(NSDictionary *)dic
{
    NSInteger index = [dic[@"index"] integerValue];
    Class className = NSClassFromString(_viewControllers[index]);
    UIViewController *vc = [className new];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
