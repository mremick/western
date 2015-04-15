//
//  WESDrugTransition.m
//  WESOptGuide
//
//  Created by Matt Remick on 3/18/15.
//  Copyright (c) 2015 Matt Remick. All rights reserved.
//

#import "WESDrugTransition.h"
#import "WESDrugDetailViewController.h"
#import "WESDrugTableViewController.h"
#import "WESAcronymTableViewCell.h"

@implementation WESDrugTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    WESDrugTableViewController *fromViewController = (WESDrugTableViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    WESDrugDetailViewController *toViewController = (WESDrugDetailViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    WESAcronymTableViewCell *cell = (WESAcronymTableViewCell *)[fromViewController.tableView cellForRowAtIndexPath:[fromViewController.tableView indexPathForSelectedRow]];
    UIView *mainLabelScreenshot = [cell.mainLabel snapshotViewAfterScreenUpdates:NO];
    UIView *detailLabelScreenshot = [cell.detailLabel snapshotViewAfterScreenUpdates:NO];
    
    mainLabelScreenshot.frame = [containerView convertRect:cell.mainLabel.frame fromView:cell.mainLabel.superview];
    detailLabelScreenshot.frame = [containerView convertRect:cell.detailLabel.frame fromView:cell.detailLabel.superview];
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.brandLabel.hidden = YES;
    toViewController.manufacturerLabel.hidden = YES;

    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:mainLabelScreenshot];
    [containerView addSubview:detailLabelScreenshot];
    
    [UIView animateWithDuration:0.3 animations:^{
        // Fade in the second view controller's view
        toViewController.view.alpha = 1.0;
        
        // Move the cell snapshot so it's over the second view controller's image view
        CGRect mainFrame = [containerView convertRect:toViewController.brandLabel.frame fromView:toViewController.brandLabel.superview];
        mainLabelScreenshot.frame = mainFrame;
        
        CGRect detailFrame = [containerView convertRect:toViewController.manufacturerLabel.frame fromView:toViewController.manufacturerLabel.superview];
        detailLabelScreenshot.frame = detailFrame;
        
        
    } completion:^(BOOL finished) {
        // Clean up
        toViewController.brandLabel.hidden = NO;
        toViewController.manufacturerLabel.hidden = NO;
        
        [mainLabelScreenshot removeFromSuperview];
        [detailLabelScreenshot removeFromSuperview];
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];

}

@end
