//
//  WESCISSViewController.m
//  WESOptGuide
//
//  Created by Matt Remick on 4/4/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import "WESCISSViewController.h"
#import "WESQualityQuestionCellTableViewCell.h"
#import "WESQualityOfLifeFooterTableViewCell.h"

@interface WESCISSViewController ()

@property (nonatomic, strong) NSArray *questions;
@property (nonatomic, strong) NSMutableArray *individualScores;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSInteger totalScore;

- (IBAction)clearButtonTapped:(id)sender;

@end

@implementation WESCISSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.individualScores = [NSMutableArray arrayWithArray:@[@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0"]];
    
    self.questions = @[
                       @"Do your eyes feel tired wehn reading or doing close work?",
                       @"Do your eyes feel uncomfortable when reading or doing close work?",
                       @"Do you have headaches when reading or doing close work?",
                       @"Do you feel sleepy when reading or doing close work?",
                       @"Do you lose concentration when reading or doing close work?",
                       @"Do you have trouble remembering what you have read?",
                       @"Do you have double vision when reading or doing close work?",
                       @"Do you see the words move, jump, swim, or appear to float on the page when reading or doing close work?",
                       @"Do you feel that you read slowly?",
                       @"Do your eyes ever hurt when reading or doing close work?",
                       @"Do your eyes ever feel sore when reading or doing close work?",
                       @"Do you feel a \"pulling\" feeling around your eyes when reading or doing close work?",
                       @"Do you notice the words blurring or coming in and out of focus when reading or doing close work?",
                       @"Difficulty completing assignments on time",
                       @"Do you lose your place when reading or doing close work?",
                       @"Do you have to re-read the same line or words when reading or doing close work?",
                       @"Does not use his/her time well"];
    
}

- (void)didReceiveMemoryWarning; {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.questions count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 87;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WESQualityQuestionCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.questionLabel.text = self.questions[indexPath.row];
    cell.tag = indexPath.row;
    cell.questionScoreTextField.text = self.individualScores[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    WESQualityOfLifeFooterTableViewCell *footerCell = [tableView dequeueReusableCellWithIdentifier:@"footerCell"];
    footerCell.totalScoreLabel.text = [NSString stringWithFormat:@"Total Score: %ld",(long)self.totalScore];
    footerCell.backgroundColor = [UIColor redColor];
    footerCell.tag = 78;
    footerCell.deleagte = self;
    return footerCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 55;
}

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
    
    WESQualityOfLifeFooterTableViewCell *footerCell = (WESQualityOfLifeFooterTableViewCell *)[self.tableView viewWithTag:78];
    footerCell.totalScoreLabel.text = [NSString stringWithFormat:@"Total Score: %ld",(long)self.totalScore];
}

- (IBAction)clearButtonTapped:(id)sender {
    
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
