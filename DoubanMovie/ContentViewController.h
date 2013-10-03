//
//  ContentViewController.h
//  ICViewPager
//
//  Created by Ilter Cengiz on 28/08/2013.
//  Copyright (c) 2013 Ilter Cengiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HostViewController.h"

@interface ContentViewController : UIViewController


-(id) initWithPageControl:(HostViewController *)pageControl PageIndex:(NSInteger)index;

@end
