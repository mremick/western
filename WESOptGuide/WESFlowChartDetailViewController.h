//
//  WESFlowChartDetailViewController.h
//  WESOptGuide
//
//  Created by Matt Remick on 3/4/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WESFlowChartDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *chartImageView;
@property (nonatomic, strong) UIImage *chartImage; 
@property (nonatomic, strong) NSString *chartTitle;
@property (weak, nonatomic) IBOutlet UIScrollView *chartScrollView;

@end
