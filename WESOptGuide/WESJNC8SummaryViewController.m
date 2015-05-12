//
//  WESJNC8SummaryViewController.m
//  WESOptGuide
//
//  Created by Matt Remick on 3/24/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import "WESJNC8SummaryViewController.h"

@interface WESJNC8SummaryViewController ()


@end

@implementation WESJNC8SummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self.textView setContentOffset: CGPointMake(0,self.navigationController.navigationBar.frame.size.height) animated:NO];
    
    [self.textView sizeToFit];


    
    self.textView.text = @"In the general population ages 60 and older, pharmacologic treatment to lower BP should be initiated at a systolic blood pressure (SBP) of 150 mmHg or higher or a diastolic blood pressure (DBP) of 90 mmHg or higher. Patients should be treated to a goal SBP lower than 150 mmHg and a goal DBP lower than 90 mmHg. If treatment results in lower achieved SBP and is not associated with adverse effects, treatment does not need to be adjusted. \nIn the general population younger than age 60, initiate pharmacologic treatment at a DBP of 90 mmHg or higher or an SBP of 140 mmHg or higher and treat to goals below these respective thresholds. \nIn the population ages 18 years or older with diabetes or CKD, initiate pharmacologic treatment at an SBP of 140 mmHg or higher or a DBP of 90 mmHg or higher and treat to goals below these respective thresholds. \nIn the general nonblack population, including those with diabetes, initial treatment should include a thiazide-type diuretic, calcium channel blocker (CCB), angiotensin-converting enzyme (ACE) inhibitor or angiotensin receptor blocker (ARB). \nIn the general black population, including those with diabetes, initial treatment should include a thiazide-type diuretic or a CCB. \nIn the population ages 18 or older with CKD and hypertension, initial (or add-on) treatment should include an ACE inhibitor or an ARB to improve kidney outcomes. This applies to all patients in this population regardless of race or diabetes status. \nFinally, the main objective of hypertension treatment is to attain and maintain goal BP. If goal BP is not reached within a month of initiating treatment, increase the dose of the initial drug or add a second drug from one of these four classes. The clinician should continue to assess BP and adjust the treatment regimen until goal BP is reached. If goal BP cannot be reached with two drugs, add and titrate a third drug from the list provided.";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
