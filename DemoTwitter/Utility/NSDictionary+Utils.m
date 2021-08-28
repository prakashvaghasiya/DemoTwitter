//
//  NSDictionary+Utils.m
//  SmartConsultant
//
//  Created by Coruscate on 4/15/15.
//  Copyright (c) 2015 Coruscate. All rights reserved.
//

#import "NSDictionary+Utils.h"

@implementation NSString (Contains)

- (BOOL) containsString: (NSString*) substring
{
    NSRange range = [self rangeOfString : substring];
    BOOL found = ( range.location != NSNotFound );
    return found;
}
@end

@implementation NSDictionary(Utils)

- (double)numberForKey:(NSString *)key
{
    BOOL isTacky = NO;
    
    if ([[self objectForKey:key] isKindOfClass:[NSNull class]] || ![self objectForKey:key])isTacky = YES;
    NSString *string =@"0";
    if(!isTacky)string = [self objectForKey:key];
    if (!string)string = @"0";
    
    return (isTacky? 0 : string.doubleValue);
    
}

- (NSInteger)integerForKey:(NSString *)key
{
    BOOL isTacky = NO;
    
    if ([[self objectForKey:key] isKindOfClass:[NSNull class]] || ![self objectForKey:key])isTacky = YES;
    NSString *string =@"0";
    if(!isTacky)string = [self objectForKey:key];
    if (!string)string = @"0";
    
    return (isTacky? 0 : string.integerValue);
    
}

- (NSString *)stringForKey:(NSString *)key
{
    BOOL isTacky = NO;
    
    if (![[self objectForKey:key] isKindOfClass:[NSString class]] && [self objectForKey:key])isTacky = YES;
    
    NSString *string = @"";
    if (!isTacky)string = (NSString *)[self objectForKey:key];
    if (!string)string = @"";
    
    return (isTacky? @"" : string);
}

- (NSArray *)arrayForKey:(NSString *)key
{
    
    BOOL isTacky = NO;
    
    if (![[self objectForKey:key] isKindOfClass:[NSArray class]] && [self objectForKey:key])isTacky = YES;
    
    NSArray *array = [NSArray array];
    if (!isTacky)array = (NSArray *)[self objectForKey:key];
    if (!array)array = [NSArray array];
    
    return (isTacky? [NSArray array] : array);
}

- (NSDictionary *)dictionaryyForKey:(NSString *)key
{
    
    BOOL isTacky = NO;
    
    if (![[self objectForKey:key] isKindOfClass:[NSDictionary class]] && [self objectForKey:key])isTacky = YES;
    
    NSDictionary *dictionary = [NSDictionary dictionary];
    if (!isTacky)dictionary = (NSDictionary *)[self objectForKey:key];
    if (!dictionary)dictionary = [NSDictionary dictionary];
    
    return (isTacky? [NSDictionary dictionary] : dictionary);
    
}

- (BOOL)boolForKey:(NSString *)key
{
    
    BOOL isTacky = NO;
    
    if ([[self objectForKey:key] isKindOfClass:[NSNull class]] || ![self objectForKey:key])isTacky = YES;
    
    return (isTacky? NO : [[self objectForKey:key]boolValue]);
    
}

@end
