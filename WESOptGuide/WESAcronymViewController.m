//
//  WESAcronymViewController.m
//  WESOptGuide
//
//  Created by Matt Remick on 12/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "WESAcronymViewController.h"
#import "WESAcronym.h"
#import "WESAcronymTableViewCell.h"

@interface WESAcronymViewController () <UITableViewDataSource,UITableViewDelegate, UISearchDisplayDelegate>

//@property (nonatomic, strong) NSArray *acronyms;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) WESAcronym *acronyms;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, copy) NSArray *searchResults;
@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchController;


@end

@implementation WESAcronymViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.searchBar.frame = CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, 44);
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (WESAcronym *)acronyms {
    if (!_acronyms) {
        
        _acronyms = [[WESAcronym alloc] init];
    }
    
    return _acronyms;
}

- (void)filteredArrayWithSearchSting:(NSString *)searchString {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",searchString];
    self.searchResults = [self.acronyms.acronymArray filteredArrayUsingPredicate:predicate];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filteredArrayWithSearchSting:searchString];
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    [self filteredArrayWithSearchSting:self.searchDisplayController.searchBar.text];
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.searchController.searchResultsTableView) {
        return self.searchResults.count;
    } else {
        return [self.acronyms.acronymArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WESAcronymTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"acronymCell"];

    if (tableView == self.searchController.searchResultsTableView) {
        cell.mainLabel.text = [self.searchResults objectAtIndex:indexPath.row];
        cell.detailLabel.text = [self.acronyms.acronymDictionary objectForKey:[self.searchResults objectAtIndex:indexPath.row]];
    } else {
        cell.mainLabel.text = [self.acronyms.acronymArray objectAtIndex:indexPath.row];
        cell.detailLabel.text = [self.acronyms.acronymDictionary objectForKey:[self.acronyms.acronymArray objectAtIndex:indexPath.row]];

    }
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 73;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *selectedAcronym;
    if (tableView == self.searchController.searchResultsTableView) {
        selectedAcronym = [self.searchResults objectAtIndex:indexPath.row];
    }  else {
        selectedAcronym = [self.acronyms.acronymArray objectAtIndex:indexPath.row];
    }
    NSString *selectedMeaning = [self.acronyms.acronymDictionary objectForKey:selectedAcronym];
    
    NSString *message = [NSString stringWithFormat:@"%@",selectedMeaning];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:selectedAcronym message:message delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
    [alertView show];
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
