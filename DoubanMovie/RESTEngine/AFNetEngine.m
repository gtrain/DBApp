//
//  AFNetEngine.h
//  BSS
//
//  Created by YANGZQ on 13-9-11.
//  Copyright (c) 2013年 YANGZQ. All rights reserved.
//

#import "AFNetEngine.h"
#import "AFJSONRequestOperation.h"
#import "MovieAPI.h"
#import "MovieDataObj.h"


@implementation AFNetEngine

+(AFNetEngine *) shareEngine{
    static AFNetEngine *_engine=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _engine=[[AFNetEngine alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
        [_engine setAllowsInvalidSSLCertificate:YES];
        [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    });
    return _engine;
}
-(id) initWithBaseURL:(NSURL *)url{
    self=[super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    self.defaultSSLPinningMode = AFSSLPinningModeNone;
    
    return self;
}

#pragma mark - Custom Request Function
//通用请求
-(void) commonMovieListRequestWithUrlPath:(NSString *)path
                                    param:(NSDictionary *)param
                              onSucceeded:(ModelBlock) succeededBlock
                                  onError:(ErrorBlock) errorBlock{
    [self getPath:path parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        MovieDataObj *obj= [[MovieDataObj alloc] initWithDictionary:responseObject];
        succeededBlock(obj);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        ELog(error);
    }];
}
//剥离




////请求正在热映
//-(void) requestPlayingMovieWithCity:(NSString *)city
//                              start:(NSNumber *)start
//                              count:(NSString *)count
//                        onSucceeded:(ModelArrayBlock) succeededBlock
//                            onError:(ErrorBlock) errorBlock{
//    NSDictionary *paramDict=@{@"city": city,
//                             @"start": start,
//                             @"count": count};
////    [self commonMovieListRequestWithUrlPath:kPathNowplaying param:paramDict onSucceeded:succeededBlock onError:errorBlock];
//}
-(void) requestMovieListWithParam:(NSDictionary *)param
                      onSucceeded:(ModelArrayBlock) succeededBlock
                          onError:(ErrorBlock) errorBlock{

    [self getPath:kPathSciFi parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *subjectsArray=[responseObject objectForKey:kKeyMovieSubjects];
        NSMutableArray *movieModelArray=[NSMutableArray arrayWithCapacity:subjectsArray.count];
        for (NSDictionary *movieDic in subjectsArray) {
            MovieModel *movie=[[MovieModel alloc] initWithDictionary:movieDic];
            [movieModelArray addObject:movie];
        }
//        self.cacheModleArray=movieModelArray;   //缓存
        succeededBlock(movieModelArray);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}


#pragma - set and get

-(NSMutableArray *)cacheModleArray{
    if (!_cacheModleArray) {
        NSMutableArray *cacheDataArray=[[NSUserDefaults standardUserDefaults] objectForKey:@"SearchCacheArray"];
        if (cacheDataArray && cacheDataArray.count !=0) {
            _cacheModleArray=[NSMutableArray arrayWithCapacity:0];
            for (NSData *modelData in cacheDataArray) {
                MovieModel *model=[NSKeyedUnarchiver unarchiveObjectWithData:modelData];
                [_cacheModleArray addObject:model];
            }
//            NSLog(@"读取缓存 %d 条 ",_cacheModleArray.count);
        }
    }
    return _cacheModleArray;
}

-(void) setCacheModleArray:(NSMutableArray *)cacheModleArray{
    if (!_cacheModleArray) {
        _cacheModleArray=[NSMutableArray arrayWithCapacity:0];
    }
    
    NSMutableArray *cahceDataArray=nil;
    if (cacheModleArray && cacheModleArray.count !=0) {
        //加入到内存
        [_cacheModleArray addObjectsFromArray:cacheModleArray]; 
        
        //加入到缓存
        cahceDataArray=[NSMutableArray arrayWithCapacity:0];
        for (MovieModel *model in cacheModleArray) {
            [cahceDataArray addObject:[NSKeyedArchiver archivedDataWithRootObject:model]];
        }
        
    }else{
        _cacheModleArray=nil;
    }
    
    //参数为nil的时候可以清空缓存
    [[NSUserDefaults standardUserDefaults] setObject:cahceDataArray forKey:@"SearchCacheArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end












