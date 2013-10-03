//
//  HostViewController.m
//  ICViewPager
//
//  Created by Ilter Cengiz on 28/08/2013.
//  Copyright (c) 2013 Ilter Cengiz. All rights reserved.
//

#import "HostViewController.h"
#import "ContentViewController.h"
#import "MovieListViewController.h"

@interface HostViewController () <ViewPagerDataSource, ViewPagerDelegate>

@end

@implementation HostViewController

- (void)viewDidLoad {
    
    self.dataSource = self;
    self.delegate = self;
    self.title = kModTitle;
    self.localDataObj=[MovieLocalData new];
    // Keeps tab bar below navigation bar on iOS 7.0+
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return _localDataObj.movieListTypeArray.count;
}
- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    //标签标题
    UILabel *label = [UILabel new];
    label.text = _localDataObj.movieListTypeArray[index];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [label sizeToFit];
    return label;
}

//实例化子view
- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    if (index==2) {
        MovieListViewController *centerController = [[MovieListViewController alloc] init];
        return centerController;
    }
    ContentViewController *cvc=[[ContentViewController alloc] initWithPageControl:self PageIndex:index];
    
    return cvc;
}

#pragma mark - ViewPagerDelegate
- (CGFloat)viewPager:(ViewPagerController *)viewPager valueForOption:(ViewPagerOption)option withDefault:(CGFloat)value {
    
    switch (option) {
        case ViewPagerOptionStartFromSecondTab:
            return 1.0;
            break;
        case ViewPagerOptionCenterCurrentTab:
            return 0.0;
            break;
        case ViewPagerOptionTabLocation:
            return 1.0;
            break;
        default:
            break;
    }
    
    return value;
}
- (UIColor *)viewPager:(ViewPagerController *)viewPager colorForComponent:(ViewPagerComponent)component withDefault:(UIColor *)color {
    
    switch (component) {
        case ViewPagerIndicator:
            return [[UIColor redColor] colorWithAlphaComponent:0.64];
            break;
        default:
            break;
    }
    
    return color;
}

@end
