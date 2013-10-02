//
//  MovieListViewController.h
//  DoubanMovie
//
//  Created by yzq on 13-9-19.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+AFNetworking.h"
#import "BigImgViewer.h"

@interface MovieListViewController : UITableViewController
@property (nonatomic,strong) NSMutableArray *movieObjArray;

@end
