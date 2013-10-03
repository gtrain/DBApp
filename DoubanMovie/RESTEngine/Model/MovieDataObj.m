//
//  MovieDataObj.m
//  DoubanMovie
//
//  Created by L3've on 13-10-3.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#import "MovieDataObj.h"

@implementation MovieDataObj

-(id) initWithDictionary:(NSDictionary *)dataDictionary{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dataDictionary];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //内嵌的dict重新赋值
    if ([value isKindOfClass:[NSArray class]]) {
        NSArray *subjectsArray=(NSArray *)value;
        NSMutableArray *movieModelArray=[NSMutableArray arrayWithCapacity:subjectsArray.count];
        for (NSDictionary *movieDic in subjectsArray) {
            MovieModel *movie=[[MovieModel alloc] initWithDictionary:movieDic];
            [movieModelArray addObject:movie];
        }
        self.movieSubjectsArray=movieModelArray;
    }else{
        NSLog(@"Undefined %@:%@",key,value);
    }
}

//#pragma mark - NSCoding
////存储的时候转换data格式
//- (void)encodeWithCoder:(NSCoder *)aCoder{
//    [aCoder encodeObject:_title forKey:@"title"];
//    [aCoder encodeObject:_original_title forKey:@"original_title"];
//    [aCoder encodeObject:_large forKey:@"large"];
//    [aCoder encodeObject:_small forKey:@"small"];
//    [aCoder encodeObject:_year forKey:@"year"];
//    
//}
//- (id)initWithCoder:(NSCoder *)aDecoder{
//    self = [super init];
//    if (self) {
//        self.title=[aDecoder decodeObjectForKey:@"title"];
//        self.original_title=[aDecoder decodeObjectForKey:@"original_title"];
//        self.large=[aDecoder decodeObjectForKey:@"large"];
//        self.small=[aDecoder decodeObjectForKey:@"small"];
//        self.year=[aDecoder decodeObjectForKey:@"year"];
//    }
//    return self;
//}




@end
