//
//  WESCISSViewController.h
//  WESOptGuide
//
//  Created by Matt Remick on 4/4/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WESQualityQuestionCellTableViewCell.h"
#import "WESQualityOfLifeFooterTableViewCell.h"

@interface WESCISSViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, WESQualityOfLifeQuestionAnswerDelegate,WESCalculateSurveyDelegate>

@end
