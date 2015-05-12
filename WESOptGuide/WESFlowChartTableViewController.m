//
//  WESFlowChartTableViewController.m
//  WESOptGuide
//
//  Created by Matt Remick on 3/3/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import "WESFlowChartTableViewController.h"
#import "WESFlowChartTableViewCell.h"
#import "WESFlowChartDetailViewController.h"
@interface WESFlowChartTableViewController ()

@property (nonatomic, strong) NSArray *flowChartArray;

@end

@implementation WESFlowChartTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *redEye = [UIImage imageNamed:@"redEye.jpg"];
    UIImage *visualLoss = [UIImage imageNamed:@"visualLoss.jpg"];
    UIImage *epiphora = [UIImage imageNamed:@"epiphora.jpg"];
    UIImage *diplopia = [UIImage imageNamed:@"diplopia.jpg"];
    
    self.flowChartArray = @[redEye, visualLoss, epiphora, diplopia];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)titleForRow:(NSInteger)row {
    switch (row) {
        case 0:
        return @"Red Eye Evaluation";
        break;
        
        case 1:
        return @"Visual Loss Evaluation";
        break;
        
        case 2:
        return @"Epiphora Evaluation";
        break;
        
        case 3:
        return @"Diplopia Evaluation";
        break;
        
        default:
        return nil;
        break;
    }
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.flowChartArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WESFlowChartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.cellImageView.image = [self.flowChartArray objectAtIndex:indexPath.row];
    cell.cellImageView.contentMode = UIViewContentModeScaleToFill;
    cell.backgroundColor = [UIColor whiteColor];
    cell.titleLabel.text = [self titleForRow:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
    WESFlowChartDetailViewController *vc = [segue destinationViewController];
    vc.chartImage = [self.flowChartArray objectAtIndex:selectedPath.row];
    vc.chartTitle = [self titleForRow:selectedPath.row];
    
    
}


@end
