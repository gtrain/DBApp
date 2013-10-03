//
//  ContentViewController.m
//  ICViewPager
//
//  Created by Ilter Cengiz on 28/08/2013.
//  Copyright (c) 2013 Ilter Cengiz. All rights reserved.
//

#import "ContentViewController.h"
#import "MovieLocalData.h"
#import "MovieDataObj.h"

@interface ContentViewController ()
@property (nonatomic,weak) HostViewController *pageControl;
@property (nonatomic) NSUInteger pageIndex;

@end

@implementation ContentViewController
-(id) initWithPageControl:(HostViewController *)pageControl PageIndex:(NSInteger)index{
    self=[super init];
    if (self) {
        self.pageControl=pageControl;
        self.pageIndex=index;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 

-(void) requestData{
//    NSDictionary *params=@{@"count": @23};    //这个用param处理
    
    [[AFNetEngine shareEngine] commonMovieListRequestWithUrlPath:[_pageControl.localDataObj urlPathWithIndex:_pageIndex] param:nil onSucceeded:^(JSONModel *aModelBaseObj) {
        MovieDataObj *resultObj=(MovieDataObj *)aModelBaseObj;
        DLog(@"title:%@, movie count %d",resultObj.title,resultObj.movieSubjectsArray.count);
    } onError:^(NSError *engineError) {
        ELog(engineError);
    }];
}

@end











