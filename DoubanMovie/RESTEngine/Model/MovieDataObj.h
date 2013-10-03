//
//  MovieDataObj.h
//  DoubanMovie
//
//  Created by L3've on 13-10-3.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#import "JSONModel.h"

@interface MovieDataObj : JSONModel
@property (nonatomic,strong) NSArray *movieSubjectsArray;

@property (nonatomic,strong) NSString *title;   //标题

@property (nonatomic,strong) NSNumber *count;   //获取到的数据条数
@property (nonatomic,strong) NSNumber *start;   //数据的起始条数
@property (nonatomic,strong) NSNumber *total;   //总数据条数

@property (nonatomic,strong) NSString *date;   //排行榜的日期

@end


/*
 -----------top 250 -------------
** 附带信息

count = 23;
start = 0;

title = "\U8c46\U74e3\U7535\U5f71Top250";
total = 250;

 -------------搜索---------------
 ** 附带信息
 count = 20;
 start = 100;
 
 title = "\U5e26\U6709\U6807\U7b7e \"\U79d1\U5e7b\" \U7684\U6761\U76ee";
 total = 200;

 --------北美票房榜----------
 date = "9\U670827\U65e5 - 9\U670829\U65e5";                            排行榜日期范围
 title = "\U8c46\U74e3\U7535\U5f71\U5317\U7f8e\U7968\U623f\U699c";
 

*/