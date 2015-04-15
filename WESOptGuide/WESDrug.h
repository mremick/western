//
//  WESDrug.h
//  WESOptGuide
//
//  Created by Matt Remick on 12/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WESDrug : NSObject

- (instancetype)initWithBrand:(NSString *)brand genericName:(NSString *)genericname
                 manufacturer:(NSString *)manufacturer pediactricUse:(NSString *)pediactricUse
                       dosage:(NSString *)dosage;

@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *genericName;
@property (nonatomic, strong) NSString *manufacturer;
@property (nonatomic, strong) NSString *pediactricUse;
@property (nonatomic, strong) NSString *dosage;

@end
