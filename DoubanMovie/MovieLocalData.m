//
//  MovieDataSource.m
//  DoubanMovie
//
//  Created by L3've on 13-10-3.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#import "MovieLocalData.h"

@implementation MovieLocalData

-(NSArray *) movieListTypeArray{
    if (!_movieListTypeArray) {
//        _movieListTypeArray=@[@"新片榜",@"正在热映",@"即将上映",@"口碑榜",@"北美票房榜",@"Top250"];
        _movieListTypeArray=@[@"北美票房榜",@"Top250",@"搜索"];
    }
    return _movieListTypeArray;
}

-(NSDictionary *) movieListTypeAndAPIDict{
    if (!_movieListTypeAndAPIDict) {
        _movieListTypeAndAPIDict=@{@"正在热映":kPathNowplaying,
                                   @"即将上映":kPathComing,
                                   @"Top250":kPathTop250,
                                    @"口碑榜":kPathWeekly,
                                 @"北美票房榜":kPathUsBox,
                                    @"新片榜":kPathNewMovies
                                   };
    }
    return _movieListTypeAndAPIDict;
}


-(NSString *) urlPathWithIndex:(NSInteger)index{
    return [self urlPathWithTitle:self.movieListTypeArray[index]];
}
-(NSString *) urlPathWithTitle:(NSString *)key{
    return self.movieListTypeAndAPIDict[key];
}


@end
