//
//  MovieModel.h
//  DoubanMovie
//
//  Created by yzq on 13-9-19.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#import "JSONModel.h"

@interface MovieModel : JSONModel

@property (nonatomic,strong) NSString *title;           //名字
@property (nonatomic,strong) NSString *original_title;  //原名

@property (nonatomic,strong) NSString *large;
@property (nonatomic,strong) NSString *small;
@property (nonatomic,strong) NSString *year;
@property (nonatomic,strong) NSString *subtype;         //分类，电影或电视剧


-(id) initWithDictionary:(NSDictionary*) jsonDic;

@end
