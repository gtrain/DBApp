//
//  MovieDataSource.h
//  DoubanMovie
//
//  Created by L3've on 13-10-3.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieAPI.h"

@interface MovieLocalData : NSObject

@property (nonatomic,strong) NSArray *movieListTypeArray;           //榜单的类型，eg ：正在热映，新片榜
@property (nonatomic,strong) NSDictionary *movieListTypeAndAPIDict; //榜单类型(key)跟api(value)对应的dictionary

//根据标题或者索引获取api接口
-(NSString *) urlPathWithIndex:(NSInteger)index;
-(NSString *) urlPathWithTitle:(NSString *)key;

@end
