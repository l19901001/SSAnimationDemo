//
//  SSCollectionView.m
//  SSAnimationDemo
//
//  Created by lss on 2015/5/30.
//  Copyright © 2015年 lss. All rights reserved.
//

#define MANGER 2
#define COL 4
#define ITEM_ID @"item_Identifier"

#import "SSCollectionView.h"
#import "SSCollectionViewCell.h"

@interface SSCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *rows;

@end

@implementation SSCollectionView

-(instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat wh = (frame.size.width-(COL+1)*MANGER)/COL;
    flowLayout.itemSize = CGSizeMake(wh, wh);
    flowLayout.minimumLineSpacing = MANGER;
    flowLayout.minimumInteritemSpacing = MANGER;
    flowLayout.sectionInset = UIEdgeInsetsMake(MANGER, MANGER, MANGER, MANGER);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    return [self initWithFrame:frame collectionViewLayout:flowLayout];
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self registerClass:[SSCollectionViewCell class] forCellWithReuseIdentifier:ITEM_ID];
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.rows.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ITEM_ID forIndexPath:indexPath];
    
    NSDictionary *dic = self.rows[indexPath.item];
    [cell configData:dic];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dic = self.rows[indexPath.item];
    
    if(_selectBlock){
        _selectBlock(dic);
    }
}

-(NSArray *)rows
{
    if(_rows == nil){
        _rows = @[@{@"title":@"基本动画", @"AnimationStyle":@"BasicAnimation", @"index":@(0)},
                  @{@"title":@"关键帧动画",@"AnimationStyle":@"KeyFrameAnimation",@"index":@(1)},
                  @{@"title":@"转场动画", @"AnimationStyle":@"Transion", @"index":@(2)},
                  @{@"title":@"隐式动画", @"AnimationStyle":@"AnimaMtuble", @"index":@(3)},
                  @{@"title":@"UIview动画", @"AnimationStyle":@"UIViewAnimation",@"index":@(4)},
                  @{@"title":@"组动画", @"AnimationStyle":@"GroupAnimation", @"index":@(5)}];
    }
    return _rows;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
