//
//  MovieListViewController.m
//  DoubanMovie
//
//  Created by yzq on 13-9-19.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#import "MovieListViewController.h"
#import "DBMovieCell.h"

@implementation MovieListViewController{
    BOOL isLoading;
}
-(id) init{
    self=[super init];
    if (self) {
        NSLog(@"MovieListViewController init");
    }
    return self;
}

- (void)viewDidLoad
{
    [self setupTalbe];
    [super viewDidLoad];
//    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(refresh)];
//    [self.navigationItem setRightBarButtonItem:rightItem];
}


-(void) setupTalbe{
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.rowHeight=kRowHeight;
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(pullToRefresh:) forControlEvents:UIControlEventValueChanged];
    
    //检测是否有缓存可用
    self.movieObjArray=[AFNetEngine shareEngine].cacheModleArray;
    if (_movieObjArray && _movieObjArray.count !=0) {
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        [self.tableView reloadData];
    }
    
    //从接口请求数据
    [self requestDatasource];
}




#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _movieObjArray.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    DBMovieCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[DBMovieCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell.imgWarpBtn addTarget:self action:@selector(imgBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    MovieModel *movieModel=_movieObjArray[indexPath.row];
    cell.movie=movieModel;
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - get data source
-(void) requestDatasource{
    //设置请求的数据行数，一开始是0，每次请求20.参数start是数据的总和
    NSDictionary *paramDic=nil;
    if (_movieObjArray && _movieObjArray.count!=0) {
        paramDic=[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:_movieObjArray.count] forKey:@"start"];
    }
//    self.title=@"数据加载中..";
    
    //发起请求
    [[AFNetEngine shareEngine] requestMovieListWithParam:paramDic onSucceeded:^(NSArray *modelObjArray) {
        //请求完成后，停止下拉刷新动画。标题栏显示电影类别
        if (self.refreshControl.isRefreshing) {
            [self.refreshControl endRefreshing];
        }
//        self.title=@"豆瓣电影-科幻类";
//        NSLog(@"get到 %d 条数据",modelObjArray.count);
        
        if (_movieObjArray && _movieObjArray.count!=0) {
            
            //排除重复
            NSMutableArray *tmpArray=[NSMutableArray arrayWithCapacity:0];
            for (MovieModel *newObj in modelObjArray) {
                BOOL isRepeated=NO;
                for (MovieModel *oldObj in _movieObjArray) {
                    if ([newObj.title isEqualToString:oldObj.title]) {
                        isRepeated=YES;
                        break;
                    }
                }
                if (!isRepeated)
                    [tmpArray addObjectsFromArray:modelObjArray]; 
                break;
            }
            
            if (tmpArray.count>0) {
//                NSLog(@" 排除重复后，新加入 %d",tmpArray.count);
                [tmpArray addObjectsFromArray:_movieObjArray];
                self.movieObjArray=tmpArray;
                [self.tableView reloadData];
                [AFNetEngine shareEngine].cacheModleArray=_movieObjArray;   //缓存
            }
        }
        
        else{
//            NSLog(@"这是第一次请求数据");
            self.movieObjArray=[NSMutableArray arrayWithArray:modelObjArray];
            [self.tableView reloadData];
            [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
            [AFNetEngine shareEngine].cacheModleArray=_movieObjArray;   //缓存
        }
        
    } onError:^(NSError *engineError) {
        //请求完成后，停止下拉刷新动画。标题栏显示状态
//        self.title=@"网络请求失败..";
        if (self.refreshControl.isRefreshing) {
            [self.refreshControl endRefreshing];
        }
    }];
}

#pragma mark - Target Function
-(void) refresh{
    [AFNetEngine shareEngine].cacheModleArray=nil;
    self.movieObjArray=nil;
    [self.tableView reloadData];
}

-(void) pullToRefresh:(id)sender{
    [self.refreshControl beginRefreshing];
    [self requestDatasource];
}

-(void) imgBtnPress:(UIButton *) sender{
    UITableViewCell *selectedCell=(UITableViewCell *)sender.superview.superview;
    if ([selectedCell isKindOfClass:[UITableViewCell class]] && !isLoading) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];        
        UIImageView *imgView=[UIImageView new];
        MovieModel *movieModel=nil;
        if (indexPath.row < _movieObjArray.count) {
            movieModel=(MovieModel *)self.movieObjArray[indexPath.row];
        }
        
        //加载图片
        NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:movieModel.large]];
        isLoading=YES;
        [imgView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            isLoading=NO;
            BigImgViewer *imgViewer=[[BigImgViewer alloc] initWithFrame:[UIScreen mainScreen].bounds image:image];
            imgViewer.alpha=.0;
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];

            [[[UIApplication sharedApplication] keyWindow] addSubview:imgViewer];
            [UIView animateWithDuration:.4 animations:^{
                imgViewer.alpha=1.0;
            }];

        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            isLoading=NO;
        }];
        
        
    }
}

@end















