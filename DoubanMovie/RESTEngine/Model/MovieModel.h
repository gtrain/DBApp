//
//  MovieModel.h
//  DoubanMovie
//
//  Created by yzq on 13-9-19.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#import "JSONModel.h"

@interface MovieModel : JSONModel

@property (nonatomic,strong) NSString *movieId;         //电影id，需要吧id转换一下

@property (nonatomic,strong) NSString *title;           //名字
@property (nonatomic,strong) NSString *original_title;  //原名

@property (nonatomic,strong) NSString *year;            //上映年代
@property (nonatomic,strong) NSString *subtype;         //分类，电影或电视剧

//images
@property (nonatomic,strong) NSString *large;
@property (nonatomic,strong) NSString *medium;
@property (nonatomic,strong) NSString *small;

@property (nonatomic,strong) NSString *alt;             //豆瓣链接
@property (nonatomic,strong) NSString *collect_count;   //看过的人数

//rating
@property (nonatomic,strong) NSNumber *average;
@property (nonatomic,strong) NSNumber *max;
@property (nonatomic,strong) NSNumber *min;
@property (nonatomic,strong) NSNumber *stars;

//票房榜
@property (nonatomic,strong) NSNumber *box;             //票房
@property (nonatomic) BOOL isNew;                       //是否最新上映
@property (nonatomic,strong) NSNumber *rank;            //排名

-(id) initWithDictionary:(NSDictionary*) jsonDic;

@end

/*
 -----------top 250 --------------
 
 ** 附带信息
 
 count = 23;
 start = 0;
 
 title = "\U8c46\U74e3\U7535\U5f71Top250";
 total = 250;
 
 ** objArray
 
    subjects =     (
    {
        id = 1292052;
 
        title = "\U8096\U7533\U514b\U7684\U6551\U8d4e";
        "original_title" = "The Shawshank Redemption";
 
        subtype = movie;
        year = 1994;
 
        images =  {
            large = "http://img3.douban.com/view/movie_poster_cover/lpst/public/p480747492.jpg";
            medium = "http://img3.douban.com/view/movie_poster_cover/spst/public/p480747492.jpg";
            small = "http://img3.douban.com/view/movie_poster_cover/ipst/public/p480747492.jpg";
        };
 
        alt = "http://movie.douban.com/subject/1292052/";
        "collect_count" = 675312;       

        rating =             {          //评分
            average = "9.5";
            max = 10;
            min = 0;
            stars = 50;
        };
        
    }...
 )
 
 
 
 -------------搜索---------------
 
 ** 附带信息
 count = 20;
 start = 100;
 
 title = "\U5e26\U6709\U6807\U7b7e \"\U79d1\U5e7b\" \U7684\U6761\U76ee";
 total = 200;
 
  ** objArray
 
 subjects =     (
    {
        alt = "http://movie.douban.com/subject/1972698/";
        "collect_count" = 46624;
        id = 1972698;
        images =             {
            large = "http://img3.douban.com/lpic/s3571830.jpg";
            medium = "http://img3.douban.com/mpic/s3571830.jpg";
            small = "http://img3.douban.com/spic/s3571830.jpg";
        };
        "original_title" = Watchmen;
        rating =             {
            average = "7.5";
            max = 10;
            min = 0;
            stars = 40;
        };
        subtype = movie;
        title = "\U5b88\U671b\U8005";
        year = 2009;
    }...
 )
 
 --------北美票房榜----------
 date = "9\U670827\U65e5 - 9\U670829\U65e5";                            排行榜日期范围
 title = "\U8c46\U74e3\U7535\U5f71\U5317\U7f8e\U7968\U623f\U699c";

 subjects =     (
                {
                    box = 35000000;
                    new = 1;
                    rank = 1;
                    subject =             {
                        alt = "http://movie.douban.com/subject/7065417/";
                        "collect_count" = 251;
                        id = 7065417;
                        images =                 {
                            large = "http://img3.douban.com/lpic/s25791312.jpg";
                            medium = "http://img3.douban.com/mpic/s25791312.jpg";
                            small = "http://img3.douban.com/spic/s25791312.jpg";
                        };
                        "original_title" = "Cloudy with a Chance of Meatballs 2";
                        rating =                 {
                            average = "7.5";
                            max = 10;
                            min = 0;
                            stars = 40;
                        };
                        subtype = movie;
                        title = "\U5929\U964d\U7f8e\U98df2";
                        year = 2013;
                    };
                },

*/












