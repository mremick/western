//
//  WESAcronym.h
//  WESOptGuide
//
//  Created by Matt Remick on 12/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WESAcronym : NSObject

- (instancetype)initWithAcronym:(NSString *)acronym meaning:(NSString *)meaning;

@property (nonatomic, strong) NSString *acronym;
@property (nonatomic, strong) NSString *meaning;

@property (strong, nonatomic) NSMutableDictionary *acronymDictionary;
@property (strong, nonatomic) NSArray *acronymArray;


@end
