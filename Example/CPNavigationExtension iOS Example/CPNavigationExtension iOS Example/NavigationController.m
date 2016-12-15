//
//  NavigationController.m
//  CPNavigationExtension iOS Example
//
//  Created by caoping on 15/12/2016.
//  Copyright © 2016 caoping. All rights reserved.
//

#import "NavigationController.h"
#import <CPNavigationExtension/CPNavigationExtension.h>

@interface NavigationController () <UINavigationControllerDelegate>

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    __weak typeof(self) weakSelf = self;
    id<UIViewControllerTransitionCoordinator> tc = navigationController.topViewController.transitionCoordinator;
    
    [tc animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        UIViewController *toVC = [context viewControllerForKey:UITransitionContextToViewControllerKey];
        [weakSelf cp_setNavigationBarAppearanceAfterLoadViewIfNeededWithViewController:toVC];
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        if ([context isCancelled]) {
            UIViewController *fromVC = [context viewControllerForKey:UITransitionContextFromViewControllerKey];
            [weakSelf cp_setNavigationBarAppearanceAfterLoadViewIfNeededWithViewController:fromVC];
        }
    }];
}

@end
