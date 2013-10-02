//
//  AFNetEngine.h
//  BSS
//
//  Created by YANGZQ on 13-9-11.
//  Copyright (c) 2013年 YANGZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigImgViewer : UIView

@property(nonatomic) float maxScale;//放大倍率（默认为放大2倍）

- (id)initWithFrame:(CGRect)frame image:(UIImage *)theImageName;

@end
