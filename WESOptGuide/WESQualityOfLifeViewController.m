//
//  WESQualityOfLifeViewController.m
//  WESOptGuide
//
//  Created by Matt Remick on 3/25/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import "WESQualityOfLifeViewController.h"
#import "WESQualityQuestionCellTableViewCell.h"
#import "WESQualityOfLifeFooterTableViewCell.h"

@interface WESQualityOfLifeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *questions;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSInteger totalScore;
@property (nonatomic, strong) NSMutableArray *individualScores;
- (IBAction)clearFieldTapped:(id)sender;
@property (nonatomic, strong) UIToolbar *toolbar;

@end

@implementation WESQualityOfLifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.individualScores = [NSMutableArray arrayWithArray:@[@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0"]];
    
    self.questions = @[
                       @"Headaches with near work",
                       @"Words run together when reading",
                       @"Burning, itchy, watery eyes",
                       @"Skips/repeats lines when reading",
                       @"Head tilt, close one eye while reading",
                       @"Difficulty copying from chalkboard / overhead",
                       @"Avoids near work / reading",
                       @"Omits small words when reading",
                       @"Writes uphill or downhill",
                       @"Misaligns digits / columns of numbers",
                       @"Reading comprehension down",
                       @"Holds reading material too close",
                       @"Trouble keeping attention on reading",
                       @"Difficulty completing assignments on time",
                       @"Always says \"I can't'\" before typing",
                       @"Clumsy, knocks things over",
                       @"Does not use his/her time well",
                       @"Loses belongings/things",
                       @"Forgetful/poor memory"];
    
    self.toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    self.toolbar.barStyle = UIBarStyleBlackTranslucent;
    self.toolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(doneWithNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [self.toolbar sizeToFit];
    
}

- (void)doneWithNumberPad {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning; {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WESQualityQuestionCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.questionLabel.text = self.questions[indexPath.row];
    cell.questionScoreTextField.inputAccessoryView = self.toolbar;
    cell.tag = indexPath.row;
    cell.questionScoreTextField.text = self.individualScores[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    WESQualityOfLifeFooterTableViewCell *footerCell = [tableView dequeueReusableCellWithIdentifier:@"footerCell"];
    footerCell.totalScoreLabel.text = [NSString stringWithFormat:@"Total Score: %ld",(long)self.totalScore];
    footerCell.deleagte = self;
    footerCell.tag = 77;
    return footerCell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 55;
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    WESQualityOfLifeFooterTableViewCell *footerCell = [tableView dequeueReusableCellWithIdentifier:@"footerCell"];
//    footerCell.totalScoreLabel.text = [NSString stringWithFormat:@"Total Score: %ld",(long)self.totalScore];
//    footerCell.deleagte = self;
//    footerCell.tag = 77;
//    return footerCell;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 55;
//}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    for (int i = 0; i < self.questions.count; i++) {
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        if ([selectedCell isKindOfClass:[WESQualityQuestionCellTableViewCell class]]) {
            [((WESQualityQuestionCellTableViewCell *)selectedCell).questionScoreTextField resignFirstResponder];
        }
    }
}

- (void)valueWasEntered:(WESQualityQuestionCellTableViewCell *)cell andReplacementString:(NSString *)string {
    
    NSInteger indexOfCell = cell.tag;
    [self.individualScores replaceObjectAtIndex:indexOfCell withObject:string];
    
    self.totalScore = 0;
    for (int i = 0; i < self.individualScores.count; i++) {
        self.totalScore += [self.individualScores[i] intValue];
    }
    
    WESQualityOfLifeFooterTableViewCell *footerCell = (WESQualityOfLifeFooterTableViewCell *)[self.tableView viewWithTag:77];
    footerCell.totalScoreLabel.text = [NSString stringWithFormat:@"Total Score: %ld",(long)self.totalScore];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clearFieldTapped:(id)sender {
    
    for (int i = 0; i < self.individualScores.count; i++) {
        [self.individualScores replaceObjectAtIndex:i withObject:@"0"];
    }
    
    self.totalScore = 0;

    
    WESQualityOfLifeFooterTableViewCell *footerCell = (WESQualityOfLifeFooterTableViewCell *)[self.tableView viewWithTag:77];
    footerCell.totalScoreLabel.text = @"Total Score: 0";
    
    [self.tableView reloadData];
}

- (void)calculateSurveyTapped:(WESQualityOfLifeFooterTableViewCell *)cell {
    
    NSString *title = [NSString stringWithFormat:@"Total score: %ld",(long)self.totalScore];
    NSString *message  = [NSString stringWithFormat:@"Based off of the totaled score <message here>"];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alertView show];
}
@end
