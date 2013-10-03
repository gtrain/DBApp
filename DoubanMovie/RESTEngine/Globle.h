//
//  Globle.h
//  DoubanMovie
//
//  Created by L3've on 13-10-3.
//  Copyright (c) 2013年 yzq. All rights reserved.
//

#ifndef DoubanMovie_Globle_h
#define DoubanMovie_Globle_h

#ifdef DEBUG

#ifndef DLog
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#endif

#ifndef ELog
#   define ELog(err) {if(err) DLog(@"%@", err)}
#endif

#endif

#define kScreenBoundsSize [UIScreen mainScreen].bounds.size



#define kBaseURL        @"https://api.douban.com/v2"











#endif
