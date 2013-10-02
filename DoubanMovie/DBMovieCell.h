//
//  DBMovieCell.h
//  DoubanMovie
//
//  Created by yzq on 13-9-20.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

#define kRowHeight          78.0
#define kMovieImgHeight     66.0
#define kMovieImgWidth      112.0
#define kMovieImgMargin     6.0
#define kMovieTitleHeight   24.0


@interface DBMovieCell : UITableViewCell{
    BOOL _noNeedLayout;
}
@property (nonatomic,strong) MovieModel *movie;

@property (nonatomic,strong) UIImageView *posterImgView;
@property (nonatomic,strong) UIButton *imgWarpBtn;
@property (nonatomic,strong) UILabel *dateLable;

@end
