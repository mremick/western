//
//  WESQualityQuestionCellTableViewCell.m
//  WESOptGuide
//
//  Created by Matt Remick on 3/25/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import "WESQualityQuestionCellTableViewCell.h"

@implementation WESQualityQuestionCellTableViewCell 

- (void)awakeFromNib {
    // Initialization code
    self.questionScoreTextField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.placeholder = textField.text;
    textField.text = @"";
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.text.length == 0) {
        textField.text = textField.placeholder;
    }
    textField.placeholder = @"";

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    [self.delegate valueWasEntered:self andReplacementString:string];

    return YES;
}

@end
