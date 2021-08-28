//
//  KM_NSArray+SafeValues.h
//  TheMovieDB
//
//  Created by Kevin Mindeguia on 03/02/2014.
//  Copyright (c) 2014 iKode Ltd. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSArray (NSArray_SafeValues)

- (NSString*)StringAtIndex:(NSUInteger)index;
- (NSNumber*)NumberAtIndex:(NSUInteger)index;
- (NSDictionary*)DictionaryAtIndex:(NSUInteger)index;
- (NSArray*)ArrayAtIndex:(NSUInteger)index;
- (id)SafeObjectAtIndex:(NSUInteger)index;

@end
