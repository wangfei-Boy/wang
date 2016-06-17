//
//  WFCollectionViewCell.m
//  test-A4-王飞
//
//  Created by ma c on 16/6/14.
//  Copyright © 2016年 wangfei. All rights reserved.
//

#import "WFCollectionViewCell.h"

@implementation WFCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor purpleColor];
        self.imageView =[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.frame)-10, CGRectGetHeight(self.frame)-10)];
        self.imageView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imageView];
        
        self.text=[[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imageView.frame), CGRectGetWidth(self.frame)-10, 20)];
        self.text.backgroundColor=[UIColor brownColor];
        self.text.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.text];
        
        self.button=[UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame=CGRectMake(5, CGRectGetMaxY(self.text.frame), CGRectGetWidth(self.frame)-10, 30);
        [self.button setTitle:@"6.6" forState:UIControlStateNormal];
        self.button.backgroundColor=[UIColor orangeColor];
        [self addSubview:self.button];
    }
    return self;
}

@end
