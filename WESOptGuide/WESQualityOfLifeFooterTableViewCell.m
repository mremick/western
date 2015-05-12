//
//  WESQualityOfLifeFooterTableViewCell.m
//  WESOptGuide
//
//  Created by Matt Remick on 4/1/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import "WESQualityOfLifeFooterTableViewCell.h"

@implementation WESQualityOfLifeFooterTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.calculateButton.clipsToBounds = YES;
    self.calculateButton.layer.cornerRadius = 25.f;
    self.calculateButton.layer.borderWidth = 2.0;
    self.calculateButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1.f];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)calculateTapped:(id)sender {
    [self.deleagte calculateSurveyTapped:self];
}
@end
