//
//  SSCollectionView.h
//  SSAnimationDemo
//
//  Created by lss on 2015/5/30.
//  Copyright © 2015年 lss. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectBlock)(NSDictionary *dic);

@interface SSCollectionView : UICollectionView

@property (nonatomic, copy) SelectBlock selectBlock;

@end
