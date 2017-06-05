//
//  Transion.m
//  SSAnimationDemo
//
//  Created by lss on 2015/5/31.
//  Copyright © 2015年 lss. All rights reserved.
//

#import "Transion.h"
#import "UINavigationController+EX.h"

@interface Transion () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *rows;

@property (nonatomic, assign) BOOL animaView;

@end

@implementation Transion

static NSString *cellid = @"cellid";
-(void)loadView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.view = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = _animaView?@"返回":NSStringFromClass([self class]);
    
    _rows = @[@{@"anima":kFADE, @"desTitle":@"交叉淡化过渡"},
              @{@"anima":kPUSH, @"desTitle":@"新视图把旧视图推出去"},
              @{@"anima":kMOVEIN, @"desTitle":@"新视图移到旧视图上面"},
              @{@"anima":kREVEAL, @"desTitle":@"将旧视图移开,显示下面的新视图"},
              @{@"anima":kOGLFLIP, @"desTitle":@"上下左右翻转效果"},
              @{@"anima":kCUBE, @"desTitle":@"立方体翻滚效果"},
              @{@"anima":kSUCKEFFECT, @"desTitle":@"收缩效果"},
              @{@"anima":kRIPPLEEFFECT, @"desTitle":@"滴水效果"},
              @{@"anima":kPAGECURL, @"desTitle":@"向上翻页效果"},
              @{@"anima":kPAGEUNCURL, @"desTitle":@"向下翻页效果"},
              @{@"anima":kCAMERAIRISHOLLOWOPEN, @"desTitle":@"镜头打开效果"},
              @{@"anima":kCAMERAIRISHOLLOWCLOSE, @"desTitle":@"镜头关上效果"}];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rows.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    
    NSDictionary *dic = _rows[indexPath.row];
    if(_animaView){
        NSString *title = [NSString stringWithFormat:@"返回-%@", dic[@"desTitle"]];
        cell.textLabel.text = title;
    }else{
        cell.textLabel.text = dic[@"anima"];
        cell.detailTextLabel.text = dic[@"desTitle"];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = _rows[indexPath.row];
    if(!_animaView){
        Transion *vc = [Transion new];
        vc.navigationItem.title = @"返回";
        vc.animaView = YES;
        [self.navigationController pushViewController:vc animation:dic[@"anima"] animationDirection:AnimationDirectionRight];
    }else{
        [self.navigationController popViewController:self animation:dic[@"anima"] animationDirection:AnimationDirectionLeft];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
