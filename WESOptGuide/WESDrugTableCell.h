//
//  WESDrugTableCell.h
//  WESOptGuide
//
//  Created by Matt Remick on 5/9/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WESDrugTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *brandLabel;
@property (weak, nonatomic) IBOutlet UILabel *manufacturerLabel;
@property (weak, nonatomic) IBOutlet UILabel *genericNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pediatricUseLabel;
@property (weak, nonatomic) IBOutlet UILabel *dosageLabel;

@end
