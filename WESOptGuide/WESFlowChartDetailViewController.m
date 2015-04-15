//
//  WESFlowChartDetailViewController.m
//  WESOptGuide
//
//  Created by Matt Remick on 3/4/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import "WESFlowChartDetailViewController.h"

@interface WESFlowChartDetailViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation WESFlowChartDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = self.chartTitle;
    self.chartImageView.image = self.chartImage;
    
    self.imageView = [[UIImageView alloc] initWithImage:self.chartImage];
    self.imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    
    self.chartScrollView.minimumZoomScale = 1.0;
    self.chartScrollView.maximumZoomScale = 4.0;
    self.chartScrollView.contentSize=CGSizeMake(screenWidth, screenHeight);
    [self.chartScrollView addSubview:self.imageView];
    [self.chartScrollView sendSubviewToBack:self.imageView];

    self.chartScrollView.delegate = self;
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
//{
//    return self.chartImageView;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
