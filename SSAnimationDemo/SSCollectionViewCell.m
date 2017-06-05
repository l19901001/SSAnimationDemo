//
//  SSCollectionViewCell.m
//  SSAnimationDemo
//
//  Created by lss on 2015/5/30.
//  Copyright © 2015年 lss. All rights reserved.
//

#import "SSCollectionViewCell.h"

@interface SSCollectionViewCell ()

@property (nonatomic, strong) NSDictionary *dic;

@end

@implementation SSCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.contentView.hidden = YES;
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

-(void)configData:(NSObject *)obj
{
    _dic = (NSDictionary *)obj.copy;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    NSString *title = _dic[@"title"];
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    textStyle.alignment = NSTextAlignmentCenter;
    textStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    NSDictionary *attrDic = @{NSFontAttributeName:[UIFont systemFontOfSize:12.f],
                              NSForegroundColorAttributeName:[UIColor whiteColor],
                              NSParagraphStyleAttributeName:textStyle};
    CGSize strSize = [title sizeWithAttributes:attrDic];
    CGFloat marginTop = (rect.size.height - strSize.height)/2;
    CGRect r = CGRectMake(rect.origin.x, rect.origin.y + marginTop,rect.size.width, strSize.height);
    [title drawInRect:r withAttributes:attrDic];
}

@end
