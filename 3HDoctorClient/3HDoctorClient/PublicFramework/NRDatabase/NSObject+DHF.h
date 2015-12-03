//
//  NSObject+DHF.h
//  NR
//
//  Created by 范英强 on 15/9/9.
//  Copyright (c) 2015年 范英强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DHF)

-(NSDictionary *)propertyList:(BOOL)isWrite;
- (NSDictionary *)toDictionary;
-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
