//
//  DBMovieCell.m
//  DoubanMovie
//
//  Created by yzq on 13-9-20.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#import "DBMovieCell.h"
#import "UIImageView+AFNetworking.h"
#import <QuartzCore/QuartzCore.h>

//typedef enum{
//    tMovieIMGBtn=101,
//    tMovieIMG,
//    tMovieTitle,
//    tMovieOriginTitle,
//    tMovieYear,
//} ViewInCell;

@implementation DBMovieCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //海报外圈
        self.imgWarpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imgWarpBtn setFrame:CGRectMake(kMovieImgMargin,(kRowHeight-kMovieImgHeight)/2, kMovieImgWidth, kMovieImgHeight)];
        [_imgWarpBtn setBackgroundColor:[UIColor colorWithWhite:.8 alpha:1.0]];
        [_imgWarpBtn.layer setCornerRadius:3.0];
        [_imgWarpBtn.layer setMasksToBounds:YES];
        [self.contentView addSubview:_imgWarpBtn];
        //海报
        self.posterImgView=[[UIImageView alloc] initWithFrame:CGRectMake(1,1, kMovieImgWidth-2, kRowHeight-kMovieImgMargin*2-2)];
        [_posterImgView.layer setCornerRadius:3.0];
        [self.imgWarpBtn addSubview:_posterImgView];
        
        
        //电影标题
        [self.textLabel setFont:[UIFont systemFontOfSize:20.0]];
        
        //原始标题
        [self.detailTextLabel setFont:[UIFont systemFontOfSize:14.0]];
        
        //上映时间
        self.dateLable =[[UILabel alloc] initWithFrame:CGRectMake(kMovieImgWidth+kMovieImgMargin*3,kMovieImgMargin+1+kMovieTitleHeight*2-4,320-kMovieImgWidth-kMovieImgMargin*4, kMovieTitleHeight-8)];
        [self.dateLable setFont:[UIFont systemFontOfSize:14.0]];
        [_dateLable setTextColor:[UIColor grayColor]];
        [self.contentView addSubview:_dateLable];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

-(void) layoutSubviews{
    [super layoutSubviews];

    [self.textLabel setFrame:CGRectMake(kMovieImgWidth+kMovieImgMargin*3,kMovieImgMargin+1,320-kMovieImgWidth-kMovieImgMargin*4, kMovieTitleHeight)];
    [self.detailTextLabel setFrame:CGRectMake(kMovieImgWidth+kMovieImgMargin*3,kMovieImgMargin+1+kMovieTitleHeight+4,320-kMovieImgWidth-kMovieImgMargin*4, kMovieTitleHeight-8)];
    
}

#pragma mark - custom funtion
-(void) setMovie:(MovieModel *)movie{
    if (movie!=_movie) {
        _movie=movie;

        self.textLabel.text=movie.title;
        self.detailTextLabel.text=movie.original_title;
        self.dateLable.text=[NSString stringWithFormat:@"%@-%@",movie.year,movie.subtype];
      
        __block UIImageView *imgView=self.posterImgView;
        [self.posterImgView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:movie.small]]
                              placeholderImage:[UIImage imageNamed:@"placeHolder"]
                                       success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                           imgView.image=image;
            //按比例调整大小
            CGFloat ratio=fmaxf(kMovieImgHeight/image.size.height, kMovieImgWidth/image.size.width);
            CGRect rect=imgView.frame;
            rect.size.height=image.size.height*ratio;
            rect.size.width=image.size.width*ratio;
            imgView.frame=rect;
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            
        }];
        
        
    }
}
@end



















