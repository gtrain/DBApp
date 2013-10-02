//
//  AFNetEngine.h
//  BSS
//
//  Created by YANGZQ on 13-9-11.
//  Copyright (c) 2013年 YANGZQ. All rights reserved.
//

#import "BigImgViewer.h"

@interface BigImgViewer  ()<UIScrollViewDelegate>
{
    UIImageView *theImage;//背景图
    UIScrollView *theScroll;//控制器

    CGFloat currentScale;//当前倍率
    CGFloat minScale;//最小倍率
    
}

@end

@implementation BigImgViewer


#pragma mark - Init
- (id)initWithFrame:(CGRect)frame image:(UIImage *)theImageName;
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithWhite:.0 alpha:.9]];
        
        //最大放大倍数(默认值)
        _maxScale=2.0;
        //设置最小倍率为1.0
        minScale=.5;
        //设置当前的放大倍数
        currentScale=1.0;
        
        //控制器
        theScroll=[[UIScrollView alloc] initWithFrame:frame];
        theScroll.userInteractionEnabled=YES;
        theScroll.maximumZoomScale=2.0;//最大倍率（默认倍率）
        theScroll.minimumZoomScale=1.0;//最小倍率（默认倍率）
        theScroll.decelerationRate=1.0;//减速倍率（默认倍率）
        theScroll.delegate=self;
        theScroll.autoresizingMask =UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight;
        [self addSubview:theScroll];
        
        //图片
        theImage=[[UIImageView alloc] initWithImage:theImageName];
        theImage.userInteractionEnabled=YES;
        theImage.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight;
        //图片放大至全屏,并且居中
        CGFloat ratio=fminf(kScreenBoundsSize.height/theImageName.size.height, kScreenBoundsSize.width/theImageName.size.width)/1.1;
        CGFloat imgHeight=theImageName.size.height*ratio;
        CGFloat imgWidth=theImageName.size.width*ratio;
        
        theImage.frame=CGRectMake((kScreenBoundsSize.width-imgWidth)/2, (kScreenBoundsSize.height-imgHeight)/2, imgWidth, imgHeight);
        [theScroll addSubview:theImage];
        
        //双击手势
        UITapGestureRecognizer *doubelGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleGesture:)];
        doubelGesture.numberOfTapsRequired=2;
        [theImage addGestureRecognizer:doubelGesture];
        //单击手势
        UITapGestureRecognizer *singleGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleGesture:)];
        singleGesture.numberOfTapsRequired=1;
        [singleGesture requireGestureRecognizerToFail:doubelGesture];
        [theImage addGestureRecognizer:singleGesture];
        
        //other
        [theScroll setContentSize:CGSizeMake(theImageName.size.width/2, theImageName.size.height/2)];
        
    }
    return self;
}

#pragma mark -setter action
-(void)setMaxScale:(float)maxScale
{
    _maxScale=maxScale;
    theScroll.maximumZoomScale=maxScale;
}

#pragma mark -UIScrollView delegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return theImage;
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    currentScale=scale;
}
#pragma mark -Gesture Action
-(void)singleGesture:(UIGestureRecognizer *)sender{
    //单击移除视图，渐变
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    [UIView animateWithDuration:.2 animations:^{
        self.alpha=.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)doubleGesture:(UIGestureRecognizer *)sender
{
    //当前倍数等于最大放大倍数
    //双击默认为缩小到原图
    if (currentScale==_maxScale) {
        currentScale=minScale;
        [theScroll setZoomScale:currentScale animated:YES];
        return;
    }
    //当前等于最小放大倍数
    //双击默认为放大到最大倍数
    if (currentScale==minScale) {
        currentScale=_maxScale;
        [theScroll setZoomScale:currentScale animated:YES];
        return;
    }
    
    CGFloat aveScale =minScale+(_maxScale-minScale)/2.0;//中间倍数
    
    //当前倍数大于平均倍数
    //双击默认为放大最大倍数
    if (currentScale>=aveScale) {
        currentScale=_maxScale;
        [theScroll setZoomScale:currentScale animated:YES];
        return;
    }
    
    //当前倍数小于平均倍数
    //双击默认为放大到最小倍数
    if (currentScale<aveScale) {
        currentScale=minScale;
        [theScroll setZoomScale:currentScale animated:YES];
        return;
    }
}

@end
