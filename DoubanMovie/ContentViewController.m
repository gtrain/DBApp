//
//  ContentViewController.m
//  ICViewPager
//
//  Created by Ilter Cengiz on 28/08/2013.
//  Copyright (c) 2013 Ilter Cengiz. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.label=[[UILabel alloc] initWithFrame:CGRectMake(20, 120, 200, 230)];
    [self.view addSubview:_label];
    _label.text = _labelString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end