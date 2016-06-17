//
//  WFUIViewController.h
//  test-A4-王飞
//
//  Created by ma c on 16/6/14.
//  Copyright © 2016年 wangfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFUIViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

{

    NSMutableArray *_cellArray;
}
@property(nonatomic,strong) UICollectionView *wfconllection;


@end
