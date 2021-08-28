//
//  NSDictionary+Utils.h
//  SmartConsultant
//
//  Created by Coruscate on 4/15/15.
//  Copyright (c) 2015 Coruscate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary(Utils)

- (double)numberForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;
- (NSDictionary *)dictionaryyForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;

@end

@interface NSString (Contains)

- (BOOL) containsString: (NSString*) substring;

@end
