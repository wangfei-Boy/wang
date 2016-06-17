//
//  WFUIViewController.m
//  test-A4-王飞
//
//  Created by ma c on 16/6/14.
//  Copyright © 2016年 wangfei. All rights reserved.
//

#import "WFUIViewController.h"
#import "WFCollectionViewCell.h"
#import <AFNetworking.h>
#import "LifeModel.h"
@interface WFUIViewController()



@end

@implementation WFUIViewController
-(UICollectionView *)wfconllection{
    if (!_wfconllection) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.headerReferenceSize=CGSizeMake(300, 200);
        _wfconllection =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 300, 500)];
        flowLayout.itemSize=CGSizeMake((300-20)/2, (300-20)/2+50);
        flowLayout.minimumLineSpacing=5;
        flowLayout.minimumInteritemSpacing=0;
        flowLayout.sectionInset=UIEdgeInsetsMake(0, 5, 5, 5);
        [_wfconllection registerClass:[WFCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_wfconllection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ResuableView"];
        _wfconllection.delegate=self;
        _wfconllection.dataSource=self;
        _wfconllection.backgroundColor=[UIColor whiteColor];
        _wfconllection.autoresizingMask=UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
        }
    return _wfconllection;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_cellArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify=@"cell";
    WFCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
//    cell.imageView.image=[UIImage imageNamed:<#(nonnull NSString *)#>]
    cell.text.text=[NSString stringWithFormat:@"Cell %ld",indexPath.item];
    return cell;
}
/*
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ResuableView" forIndexPath:indexPath];
//    [headerView addSubview:_headerView];
    return headerView;
}
*/
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选择了%ld",indexPath.item);
}



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(void)methodGet{
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
    [manger GET:@"http://www.benlai.com/IProductList/List?limit=201&localcity=2&sort=8&source=3&systemVersion=4.4.2&c1SysNo=48&offset=0&channel=wandoujia&deviceId=86377702544822518%3Adc%3A56%3Af0%3A0d%3A9f&phoneModel=Coolpad+8297&pageid=com.android.benlai.activity.ProductListActivity&version=2.0.4&sign=63A8B253EFDD4BC3DA611DE1671B5274" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject[@"data"];
        
        NSArray *array = dic[@"productList"];
        
        NSMutableArray *muArr = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            
            LifeModel *model = [LifeModel lifeWithDictionary:dic];
            [muArr addObject:model];
        }
        self.arrayList = muArr;
        
        
        [self.collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

-(void)viewDidLoad{
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"购物车";
    [self.view addSubview:self.wfconllection];
    
}
@end
