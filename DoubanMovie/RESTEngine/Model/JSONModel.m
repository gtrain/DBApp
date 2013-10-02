//
//  AFNetEngine.h
//  BSS
//
//  Created by YANGZQ on 13-9-11.
//  Copyright (c) 2013年 YANGZQ. All rights reserved.
//

#import "JSONModel.h"


@implementation JSONModel

-(id) initWithDictionary:(NSMutableDictionary*) jsonObject
{
    if((self = [super init]))
    {
        [self setValuesForKeysWithDictionary:jsonObject];
    }
    return self;
}

-(BOOL) allowsKeyedCoding
{
	return YES;
}

- (id) initWithCoder:(NSCoder *)decoder
{	
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	// do nothing.
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
  // subclass implementation should do a deep mutable copy
  // this class doesn't have any ivars so this is ok
	JSONModel *newModel = [[JSONModel allocWithZone:zone] init];
	return newModel;
}

-(id) copyWithZone:(NSZone *)zone
{    
  // subclass implementation should do a deep mutable copy
  // this class doesn't have any ivars so this is ok
	JSONModel *newModel = [[JSONModel allocWithZone:zone] init];
	return newModel;
}

- (id)valueForUndefinedKey:(NSString *)key
{
//    NSLog(@"Undefined Key: %@", key);
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
//    NSLog(@"Undefined Key: %@", key);
}



@end
