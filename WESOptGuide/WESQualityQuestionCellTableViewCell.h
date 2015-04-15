//
//  WESQualityQuestionCellTableViewCell.h
//  WESOptGuide
//
//  Created by Matt Remick on 3/25/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WESQualityQuestionCellTableViewCell;

@protocol WESQualityOfLifeQuestionAnswerDelegate <NSObject>

- (void)valueWasEntered:(WESQualityQuestionCellTableViewCell *)cell andReplacementString:(NSString *)string;

@end

@interface WESQualityQuestionCellTableViewCell : UITableViewCell <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITextField *questionScoreTextField;
- (IBAction)didTapTextField:(id)sender;

@property (nonatomic, weak) id <WESQualityOfLifeQuestionAnswerDelegate> delegate;

@end
