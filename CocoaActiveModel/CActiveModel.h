//
//  CActiveModel.h
//  CocoaActiveModel
//
//  Created by Zachary Quintana on 12/27/12.
//  Copyright (c) 2012 Zachary Quintana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CActiveModel : NSObject

@property (retain) NSString *_pk;
@property (retain) NSMutableDictionary *_attributes;

- (id)initWithAttributes:(NSDictionary *)attributes;
- (id)get:(id)key;
- (NSString *)getString:(id)key;
- (NSNumber *)getNumber:(id)key;
- (NSArray *)getArray:(id)key;
- (NSDate *)getDate:(id)key;
- (NSDate *)getDate:(id)key withDefault:(id)defaultValue;
//- (NSDate *)getDateWithTimeIntervalSince1970:(id)key;
- (NSDate *)dateFromNumberWithTimeIntervalSince1970:(NSNumber *)number;
- (NSDictionary *)getDictionary:(id)key;
- (BOOL)getBool:(id)key;
- (void)setKey:(id)key value:(id)value;
- (void)setValue:(id)value forKey:(NSString *)key;
- (void)setAttributesFromDictionary:(NSDictionary *)attributes;
- (NSMutableDictionary *)modelAttributes;
+ (id)modelWithAttributes:(NSDictionary *)attributes;
+ (id)modelWithDictionary:(NSDictionary *)dictionary;

@end
