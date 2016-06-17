//
//  LifeModel.m
//  本来生活
//
//  Created by 小新 on 16/6/14.
//  Copyright © 2016年 Mark-zhx. All rights reserved.
//

#import "LifeModel.h"

@implementation LifeModel

+ (instancetype)lifeWithDictionary:(NSDictionary *)dic{
    
    return [[self alloc]initWithDictionary:dic];
}

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        
        self.briefName = dic[@"briefName"];
        self.price = dic[@"price"];
        self.imageUrl = dic[@"imageUrl"];
        
    }
    return self;
}

@end
