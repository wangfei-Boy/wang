//
//  LifeModel.h
//  本来生活
//
//  Created by 小新 on 16/6/14.
//  Copyright © 2016年 Mark-zhx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LifeModel : NSObject

@property (copy, nonatomic) NSString *briefName;
@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *imageUrl;

+ (instancetype)lifeWithDictionary:(NSDictionary *)dic;
@end
