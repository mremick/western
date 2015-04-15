//
//  WESDrugDetailViewController.h
//  WESOptGuide
//
//  Created by Matt Remick on 12/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WESDrug.h"

@interface WESDrugDetailViewController : UIViewController

@property (nonatomic, strong) WESDrug *selectedDrug;

@property (weak, nonatomic) IBOutlet UILabel *brandLabel;
@property (weak, nonatomic) IBOutlet UILabel *genericNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *manufacturerLabel;
@property (weak, nonatomic) IBOutlet UILabel *pediactricUseLabel;
@property (weak, nonatomic) IBOutlet UILabel *dosageLabel;

@end
