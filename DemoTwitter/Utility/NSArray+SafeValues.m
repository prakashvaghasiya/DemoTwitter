//
//  KM_NSArray+SafeValues.m
//  TheMovieDB
//
//  Created by Kevin Mindeguia on 03/02/2014.
//  Copyright (c) 2014 iKode Ltd. All rights reserved.
//

#import "NSArray+SafeValues.h"

@implementation NSArray (NSArray_SafeValues)

- (NSString*)StringAtIndex:(NSUInteger)index {
    NSString* string = nil;
    
    if (index < self.count){
        id obj = [self objectAtIndex:index];
        if ([obj isKindOfClass:[NSString class]]){
            string = obj;
        }
    }
    
    if (!string) {
        string = @"";
    }
    return string;
}

- (NSNumber*)NumberAtIndex:(NSUInteger)index {
    NSNumber* number = nil;
    
    if (index < self.count){
        id obj = [self objectAtIndex:index];
        if ([obj isKindOfClass:[NSNumber class]]){
            number = obj;
        }
    }
    
    if (!number) {
        number = [NSNumber numberWithInt:0];
    }
    return number;
}


- (NSDictionary*)DictionaryAtIndex:(NSUInteger)index {
    NSDictionary* dictionary = [NSDictionary dictionary];
    
    if (index < self.count){
        id obj = [self objectAtIndex:index];
        if ([obj isKindOfClass:[NSDictionary class]]){
            dictionary = obj;
        }
    }
    
    if (!dictionary) {
        dictionary = [NSDictionary dictionary];
    }
    return dictionary;
}

- (NSArray*)ArrayAtIndex:(NSUInteger)index {
    NSArray* arrayOBJ = nil;
    
    if (index < self.count){
        id obj = [self objectAtIndex:index];
        if ([obj isKindOfClass:[NSArray class]]){
            arrayOBJ = obj;
        }
    }
    
    if (!arrayOBJ) {
        arrayOBJ = [NSArray array];
    }
    return arrayOBJ;
}

- (id)SafeObjectAtIndex:(NSUInteger)index {
    id Object = nil;
    
    if (index < self.count){
        Object = [self objectAtIndex:index];
    }
    
    return Object;
}

@end
