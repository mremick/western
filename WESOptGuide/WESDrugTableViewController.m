//
//  WESDrugTableViewController.m
//  WESOptGuide
//
//  Created by Matt Remick on 12/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "WESDrugTableViewController.h"
#import "WESDrug.h"
#import "WESDrugDetailViewController.h"
#import "WESAcronymTableViewCell.h"
#import "WESHeaderTableViewCell.h"
#import "WESDrugTransition.h"
#import "WESDrugTableCell.h"

@interface WESDrugTableViewController () <UITableViewDataSource,UITableViewDelegate/*UINavigationControllerDelegate*/>

@property (nonatomic, strong) NSMutableArray *antibioticDrugs;
@property (nonatomic, strong) NSMutableArray *antiAllergyDrugs;
@property (nonatomic, strong) NSMutableArray *antiInflamatoryDrugs;
@property (nonatomic, strong) NSMutableArray *steroidAntibiotic;
@property (nonatomic, strong) NSMutableArray *nsAids;
@property (nonatomic, strong) NSMutableArray *antivirals;
@property (nonatomic, strong) NSMutableArray *glaucoma;



@end

@implementation WESDrugTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self initAntibiotic];
    [self initAntiAllergy];
    [self initAntiInflamatory];
    [self initSteroidAntibiotic];
    [self initNSAids];
    [self initAntivirals];
    [self initGlaucoma];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Stop being the navigation controller's delegate
//    if (self.navigationController.delegate == self) {
//        self.navigationController.delegate = nil;
//    }
}

- (void)initAntibiotic {
    self.antibioticDrugs = [NSMutableArray new];
    NSString *antibioticsFilePath = [[NSBundle mainBundle] pathForResource:@"Antibiotics" ofType:@"json"];
    NSData *antibiotics = [NSData dataWithContentsOfFile:antibioticsFilePath];
    
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:antibiotics options:NSJSONReadingAllowFragments error:&error];
    int counter = 0;
    for (NSDictionary *antibioticDrug in dictionary) {
        WESDrug *drug = [[WESDrug alloc] initWithBrand:[antibioticDrug objectForKey:@"BRAND NAME"]
                                           genericName:[antibioticDrug objectForKey:@" GENERIC NAME"]
                                          manufacturer:[antibioticDrug objectForKey:@" MANUFACTURER"]
                                         pediactricUse:[antibioticDrug objectForKey:@" PEDIATRIC USE"]
                                                dosage:[antibioticDrug objectForKey:@" DOSAGE"]];
        [self.antibioticDrugs insertObject:drug atIndex:counter];
        counter++;
    }
    
    counter = 0;

}

- (void)initAntiAllergy {
    self.antiAllergyDrugs = [NSMutableArray new];
    NSString *antibioticsFilePath = [[NSBundle mainBundle] pathForResource:@"Anti_Allergy_Medications" ofType:@"json"];
    NSData *antibiotics = [NSData dataWithContentsOfFile:antibioticsFilePath];
    
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:antibiotics options:NSJSONReadingAllowFragments error:&error];
    
    int counter = 0;
    for (NSDictionary *antibioticDrug in dictionary) {
        WESDrug *drug = [[WESDrug alloc] initWithBrand:[antibioticDrug objectForKey:@" BRAND NAME"]
                                           genericName:[antibioticDrug objectForKey:@" GENERIC NAME"]
                                          manufacturer:[antibioticDrug objectForKey:@" MANUFACTURER"]
                                         pediactricUse:[antibioticDrug objectForKey:@" PEDIATRIC USE"]
                                                dosage:[antibioticDrug objectForKey:@" DOSAGE"]];
        [self.antiAllergyDrugs insertObject:drug atIndex:counter];
        counter++;
    }
    
    counter = 0;
}

- (void)initAntiInflamatory {
    self.antiInflamatoryDrugs = [NSMutableArray new];
    NSString *antibioticsFilePath = [[NSBundle mainBundle] pathForResource:@"AntiInflamatory" ofType:@"json"];
    NSData *antibiotics = [NSData dataWithContentsOfFile:antibioticsFilePath];
    
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:antibiotics options:NSJSONReadingAllowFragments error:&error];
    
    int counter = 0;
    for (NSDictionary *antibioticDrug in dictionary) {
        WESDrug *drug = [[WESDrug alloc] initWithBrand:[antibioticDrug objectForKey:@" BRAND NAME"]
                                           genericName:[antibioticDrug objectForKey:@" GENERIC NAME"]
                                          manufacturer:[antibioticDrug objectForKey:@" MANUFACTURER"]
                                         pediactricUse:[antibioticDrug objectForKey:@" PEDIATRIC USE"]
                                                dosage:[antibioticDrug objectForKey:@" DOSAGE"]];
        [self.antiInflamatoryDrugs insertObject:drug atIndex:counter];
        counter++;
    }
    
    counter = 0;
}

- (void)initSteroidAntibiotic {
    self.steroidAntibiotic = [NSMutableArray new];
    NSString *antibioticsFilePath = [[NSBundle mainBundle] pathForResource:@"steroidAntibiotic" ofType:@"json"];
    NSData *antibiotics = [NSData dataWithContentsOfFile:antibioticsFilePath];
    
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:antibiotics options:NSJSONReadingAllowFragments error:&error];
    
    int counter = 0;
    for (NSDictionary *antibioticDrug in dictionary) {
        WESDrug *drug = [[WESDrug alloc] initWithBrand:[antibioticDrug objectForKey:@"BRAND NAME"]
                                           genericName:[antibioticDrug objectForKey:@" GENERIC NAME"]
                                          manufacturer:[antibioticDrug objectForKey:@" MANUFACTURER"]
                                         pediactricUse:[antibioticDrug objectForKey:@" PEDIATRIC USE"]
                                                dosage:[antibioticDrug objectForKey:@" DOSAGE"]];
        [self.steroidAntibiotic insertObject:drug atIndex:counter];
        counter++;
    }
    
    counter = 0;
}

- (void)initNSAids {
    self.nsAids = [NSMutableArray new];
    NSString *antibioticsFilePath = [[NSBundle mainBundle] pathForResource:@"nsAids" ofType:@"json"];
    NSData *antibiotics = [NSData dataWithContentsOfFile:antibioticsFilePath];
    
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:antibiotics options:NSJSONReadingAllowFragments error:&error];
    
    int counter = 0;
    for (NSDictionary *antibioticDrug in dictionary) {
        WESDrug *drug = [[WESDrug alloc] initWithBrand:[antibioticDrug objectForKey:@"BRAND NAME"]
                                           genericName:[antibioticDrug objectForKey:@" GENERIC NAME"]
                                          manufacturer:[antibioticDrug objectForKey:@" MANUFACTURER"]
                                         pediactricUse:[antibioticDrug objectForKey:@" PEDIATRIC USE"]
                                                dosage:[antibioticDrug objectForKey:@" DOSAGE"]];
        [self.nsAids insertObject:drug atIndex:counter];
        counter++;
    }
    
    counter = 0;
}

- (void)initAntivirals {
    self.antivirals = [NSMutableArray new];
    NSString *antibioticsFilePath = [[NSBundle mainBundle] pathForResource:@"antivirals" ofType:@"json"];
    NSData *antibiotics = [NSData dataWithContentsOfFile:antibioticsFilePath];
    
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:antibiotics options:NSJSONReadingAllowFragments error:&error];
    
    int counter = 0;
    for (NSDictionary *antibioticDrug in dictionary) {
        WESDrug *drug = [[WESDrug alloc] initWithBrand:[antibioticDrug objectForKey:@" BRAND NAME"]
                                           genericName:[antibioticDrug objectForKey:@" GENERIC NAME"]
                                          manufacturer:[antibioticDrug objectForKey:@" MANUFACTURER"]
                                         pediactricUse:[antibioticDrug objectForKey:@" PEDIATRIC USE"]
                                                dosage:[antibioticDrug objectForKey:@" DOSAGE"]];
        [self.antivirals insertObject:drug atIndex:counter];
        counter++;
    }
    
    counter = 0;
}

- (void)initGlaucoma {
    self.glaucoma = [NSMutableArray new];
    NSString *antibioticsFilePath = [[NSBundle mainBundle] pathForResource:@"glaucoma" ofType:@"json"];
    NSData *antibiotics = [NSData dataWithContentsOfFile:antibioticsFilePath];
    
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:antibiotics options:NSJSONReadingAllowFragments error:&error];
    
    int counter = 0;
    for (NSDictionary *antibioticDrug in dictionary) {
        WESDrug *drug = [[WESDrug alloc] initWithBrand:[antibioticDrug objectForKey:@" BRAND NAME"]
                                           genericName:[antibioticDrug objectForKey:@" GENERIC NAME"]
                                          manufacturer:[antibioticDrug objectForKey:@" MANUFACTURER"]
                                         pediactricUse:[antibioticDrug objectForKey:@" PEDIATRIC USE"]
                                                dosage:[antibioticDrug objectForKey:@" DOSAGE"]];
        [self.glaucoma insertObject:drug atIndex:counter];
        counter++;
    }
    
    counter = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    if (section == 0) {
        return [self.antibioticDrugs count];
    } else if (section == 1) {
        return [self.antiAllergyDrugs count];
    } else if (section == 2) {
        return [self.antiInflamatoryDrugs count];
    } else if (section == 3) {
        return [self.steroidAntibiotic count];
    } else if (section == 4) {
        return [self.nsAids count];
    } else if (section == 5) {
        return [self.antivirals count];
    } else if (section == 6) {
        return [self.glaucoma count];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WESDrugTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drugCell" forIndexPath:indexPath];
    WESDrug *drug;
    if (indexPath.section == 0) {
        drug = [self.antibioticDrugs objectAtIndex:indexPath.row];
    } else if (indexPath.section == 1) {
        drug = [self.antiAllergyDrugs objectAtIndex:indexPath.row];
    } else if (indexPath.section == 2) {
        drug = [self.antiInflamatoryDrugs objectAtIndex:indexPath.row];
    } else if (indexPath.section == 3) {
        drug = [self.steroidAntibiotic objectAtIndex:indexPath.row];
    } else if (indexPath.section == 4) {
        drug = [self.nsAids objectAtIndex:indexPath.row];
    } else if (indexPath.section == 5) {
        drug = [self.antivirals objectAtIndex:indexPath.row];
    } else if (indexPath.section == 6) {
        drug = [self.glaucoma objectAtIndex:indexPath.row];
    }
    cell.brandLabel.text = drug.brand;
    //cell.detailLabel.text = [drug.genericName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];;
    cell.genericNameLabel.text = [NSString stringWithFormat:@"Generic name: %@",drug.genericName];
    cell.manufacturerLabel.text = [NSString stringWithFormat:@"Manufacturer: %@",drug.manufacturer];
    cell.dosageLabel.text = [NSString stringWithFormat:@"Dosage: %@",drug.dosage];
    cell.pediatricUseLabel.text = [NSString stringWithFormat:@"Pediactric use: %@",drug.pediactricUse];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 165;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    WESHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"header"];
    cell.headerLabel.text = [self headerTitleForSection:section];
    cell.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1.f];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (NSString *)headerTitleForSection:(NSInteger)section {
    switch (section) {
        case 0:
        return @"Antibiotic Medication";
        break;
        
        case 1:
        return @"Anti Allergy Medication";
        break;
        
        case 2:
        return @"Anti Inflamatory Medication";
        break;
        
        case 3:
        return @"Anto Biotic Steroid Medication";
        break;
        
        case 4:
        return @"Nsaids";
        break;
        
        case 5:
        return @"Anti Viral Medication";
        break;
        
        case 6:
        return @"";
        break;
        
        default:
        return nil;
        break;
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    WESDrugDetailViewController *destinationVC = [segue destinationViewController];
    NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
    WESDrug *selectedDrug;
    if (selectedPath.section == 0) {
        selectedDrug = [self.antibioticDrugs objectAtIndex:selectedPath.row];
    } else if (selectedPath.section == 1) {
        selectedDrug = [self.antiAllergyDrugs objectAtIndex:selectedPath.row];
    } else if (selectedPath.section == 2) {
        selectedDrug = [self.antiInflamatoryDrugs objectAtIndex:selectedPath.row];
    } else if (selectedPath.section == 3) {
        selectedDrug = [self.steroidAntibiotic objectAtIndex:selectedPath.row];
    } else if (selectedPath.section == 4) {
        selectedDrug = [self.nsAids objectAtIndex:selectedPath.row];
    } else if (selectedPath.section == 5) {
        selectedDrug = [self.antivirals objectAtIndex:selectedPath.row];
    } else if (selectedPath.section == 6) {
        selectedDrug = [self.glaucoma objectAtIndex:selectedPath.row];
    }
    
    destinationVC.selectedDrug = selectedDrug;
    
}

#pragma mark - UINavigationControllerDelegate

//- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
//                                  animationControllerForOperation:(UINavigationControllerOperation)operation
//                                               fromViewController:(UIViewController *)fromVC
//                                                 toViewController:(UIViewController *)toVC {
//    // Check if we're transitioning from this view controller to a DSLSecondViewController
//    if (fromVC == self && [toVC isKindOfClass:[WESDrugDetailViewController class]]) {
//        return [[WESDrugTransition alloc] init];
//    }
//    else {
//        return nil;
//    }
//}

@end
