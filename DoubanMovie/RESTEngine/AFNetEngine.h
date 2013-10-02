//
//  AFNetEngine.h
//  BSS
//
//  Created by YANGZQ on 13-9-11.
//  Copyright (c) 2013年 YANGZQ. All rights reserved.
//

#import "AFHTTPClient.h"
#import "JSONModel.h"
#import "MovieModel.h"

typedef void (^VoidBlock)(void);
typedef void (^ModelBlock)(JSONModel *aModelBaseObj);
typedef void (^DictionaryBlock)(NSDictionary *dictionary);
typedef void (^ModelArrayBlock)(NSArray *modelObjArray);
typedef void (^ErrorBlock)(NSError* engineError);

@interface AFNetEngine : AFHTTPClient{
    NSMutableArray *_cacheModleArray;
}

@property (nonatomic,strong) NSMutableArray *cacheModleArray;

+(AFNetEngine *) shareEngine;

-(void) requestMovieListWithParam:(NSDictionary *)param
                      OnSucceeded:(ModelArrayBlock) succeededBlock
                          onError:(ErrorBlock) errorBlock;

@end


















