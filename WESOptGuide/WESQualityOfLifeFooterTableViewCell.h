//
//  WESQualityOfLifeFooterTableViewCell.h
//  WESOptGuide
//
//  Created by Matt Remick on 4/1/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WESQualityOfLifeFooterTableViewCell;

@protocol WESCalculateSurveyDelegate <NSObject>

- (void)calculateSurveyTapped:(WESQualityOfLifeFooterTableViewCell *)cell; ;

@end

@interface WESQualityOfLifeFooterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *totalScoreLabel;
- (IBAction)calculateTapped:(id)sender;

@property (nonatomic, weak) id <WESCalculateSurveyDelegate> deleagte;

@end
