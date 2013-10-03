//
//  HostViewController.h
//  ICViewPager
//
//  Created by Ilter Cengiz on 28/08/2013.
//  Copyright (c) 2013 Ilter Cengiz. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MovieLocalData.h"
#import "ViewPagerController.h"

@interface HostViewController : ViewPagerController
@property (strong,nonatomic) NSArray *viewControllerArray;
@property (nonatomic,strong) MovieLocalData *localDataObj;

@end
