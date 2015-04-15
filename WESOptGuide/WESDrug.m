//
//  WESDrug.m
//  WESOptGuide
//
//  Created by Matt Remick on 12/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "WESDrug.h"

@implementation WESDrug

- (instancetype)initWithBrand:(NSString *)brand genericName:(NSString *)genericname
                 manufacturer:(NSString *)manufacturer pediactricUse:(NSString *)pediactricUse
                       dosage:(NSString *)dosage {
    
    self = [super init];
    
    if (self) {
        _brand = brand;
        _genericName = genericname;
        _manufacturer = manufacturer;
        _pediactricUse = pediactricUse;
        _dosage = dosage;
    }
    
    return self;
}

@end
