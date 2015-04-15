//
//  WESDrugDetailViewController.m
//  WESOptGuide
//
//  Created by Matt Remick on 12/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "WESDrugDetailViewController.h"

@interface WESDrugDetailViewController ()

@end

@implementation WESDrugDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.title = self.selectedDrug.brand;
    
    self.brandLabel.text = self.selectedDrug.brand;
    self.genericNameLabel.text = [NSString stringWithFormat:@"Generic Name: %@",self.selectedDrug.genericName];
    self.manufacturerLabel.text = [NSString stringWithFormat:@"%@",self.selectedDrug.manufacturer];
    self.pediactricUseLabel.text = [NSString stringWithFormat:@"Pediactric Use: %@",self.selectedDrug.pediactricUse];
    self.dosageLabel.text = [NSString stringWithFormat:@"Dosage: %@",self.selectedDrug.dosage];
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
