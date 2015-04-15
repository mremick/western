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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)calculateTapped:(id)sender {
    [self.deleagte calculateSurveyTapped:self];
}
@end
