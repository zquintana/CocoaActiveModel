//
//  CActiveModel.m
//  CocoaActiveModel
//
//  Created by Zachary Quintana on 12/27/12.
//  Copyright (c) 2012 Zachary Quintana. All rights reserved.
//

#import "CActiveModel.h"

@implementation CActiveModel

@synthesize _attributes = __attributes, _pk = __pk;

+ (id)modelWithAttributes:(NSDictionary *)attributes
{
    return [[[self class] alloc] initWithAttributes:[NSMutableDictionary dictionaryWithDictionary:attributes]];
}

+ (id)modelWithDictionary:(NSDictionary *)dictionary
{
    return [[self class] modelWithAttributes:[NSMutableDictionary dictionaryWithDictionary:dictionary]];
}

- (id)initWithAttributes:(NSMutableDictionary *)attributes
{
    self = [super init];
    if (self) {
        self._attributes = attributes;
        [self._attributes retain];
        [self setup];
    }
    
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self._attributes = [NSMutableDictionary dictionary];
        [self._attributes retain];
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self._pk = @"id";
    [self._pk retain];
}

- (id)get:(id)key
{
    return [self._attributes objectForKey:key];
}

- (NSString *)getString:(id)key
{
    NSString *value = (NSString *)[self get:key];
    return (value) ? value : @"";
}

- (NSNumber *)getNumber:(id)key
{
    NSNumber *value = (NSNumber *)[self get:key];
    return (value) ? value : [[NSNumber alloc] init];
}

- (NSArray *)getArray:(id)key
{
    NSArray *value = (NSArray *)[self get:key];
    return (value) ? value : [NSArray array];
}

- (NSDate *)getDate:(id)key
{
    return [self getDate:key withDefault:nil];
}

- (NSDate *)getDate:(id)key withDefault:(id)defaultValue
{
    id value = [self get:key];
    if ([value isKindOfClass:[NSDate class]])
        return (NSDate *)value;
    else if ([value isKindOfClass:[NSNumber class]]) {
        return [self dateFromNumberWithTimeIntervalSince1970:(NSNumber *)value];
    }
    
    return defaultValue;
}

/*- (NSDate *)getDateWithTimeIntervalSince1970:(id)key
 {
 
 }*/

- (NSDate *)dateFromNumberWithTimeIntervalSince1970:(NSNumber *)number
{
    NSTimeInterval timeInterval = (double)([number doubleValue]/1000);
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}

- (BOOL)getBool:(id)key
{
    id value = [self get:key];
    return ([value isKindOfClass:[NSNumber class]]) ? [(NSNumber *)value boolValue] : NO;
}

- (NSDictionary *)getDictionary:(id)key
{
    NSDictionary *value = (NSDictionary *)[self get:key];
    return (value) ? value : [NSDictionary dictionary];
}

- (void)setKey:(id)key value:(id)value
{
    if (!self._attributes) {
        self._attributes = [NSMutableDictionary dictionary];
    }
    
    [self._attributes setValue:value forKey:key];
    return;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    [self setKey:key value:value];
    return;
}

- (id)valueForKey:(NSString *)key
{
    if ([super valueForKey:key])
        return [super valueForKey:key];
    
    return [self get:key];
}

- (void)setAttributesFromDictionary:(NSDictionary *)attributes
{
    for (id key in attributes) {
        [self setKey:key value:[attributes objectForKey:key]];
    }
    
    return;
}

- (NSMutableDictionary *)modelAttributes
{
    NSMutableDictionary *data = [NSMutableDictionary dictionaryWithCapacity:[self._attributes count]];
    for (id key in self._attributes) {
        NSLog(@"KEY %@", key);
        
        id value = [self._attributes objectForKey:key];
        if ([key isKindOfClass:[NSString class]]) {
            SEL sel = NSSelectorFromString(key);
            
            if ([self respondsToSelector:sel]) {
                value = [self performSelector:sel];
                
                if (!value) {
                    continue;
                }
            }
        }
        
        if ([value isKindOfClass:[CActiveModel class]])
            value = [value getNumber:[(CActiveModel *)value _pk]];
        
        [data setValue:value forKey:key];
    }
    
    return data;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", [self class], [self._attributes description]];
}

- (void)dealloc
{
    [self._attributes release];
    self._attributes = nil;
    
    [self._pk release];
    self._pk = nil;
    [super dealloc];
}


@end
