//
//  MovieModel.m
//  DoubanMovie
//
//  Created by yzq on 13-9-19.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel

-(id) initWithDictionary:(NSDictionary *)dataDictionary{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dataDictionary];
        [self setValuesForKeysWithDictionary:[dataDictionary objectForKey:@"images"]];
    }
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_original_title forKey:@"original_title"];
    [aCoder encodeObject:_large forKey:@"large"];
    [aCoder encodeObject:_small forKey:@"small"];
    [aCoder encodeObject:_year forKey:@"year"];
    
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.title=[aDecoder decodeObjectForKey:@"title"];
        self.original_title=[aDecoder decodeObjectForKey:@"original_title"];
        self.large=[aDecoder decodeObjectForKey:@"large"];
        self.small=[aDecoder decodeObjectForKey:@"small"];
        self.year=[aDecoder decodeObjectForKey:@"year"];
    }
    return self;
}

@end
