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

//加载电影信息
-(void) commonMovieListRequestWithUrlPath:(NSString *)path
                                    param:(NSDictionary *)param
                              onSucceeded:(ModelBlock) succeededBlock
                                  onError:(ErrorBlock) errorBlock;




//加载搜索列表
-(void) requestMovieListWithParam:(NSDictionary *)param
                      onSucceeded:(ModelArrayBlock) succeededBlock
                          onError:(ErrorBlock) errorBlock;
//
///** 正在上映.
// @param city     Optional (default: 北京)	 中文，如: “北京” 或者数字ID: 108288
// @param start    Optional(default: 0)	 0
// @param count    Optional	 50，无法更改 
// @param onSucceeded 成功时的回调.
// @param onError     错误时的回调.
// 
// @return void
// */
//-(void) requestPlayingMovieWithCity:(NSString *)city
//                              start:(NSNumber *)start
//                              count:(NSString *)count
//                        onSucceeded:(ModelArrayBlock) succeededBlock
//                            onError:(ErrorBlock) errorBlock;








@end


















