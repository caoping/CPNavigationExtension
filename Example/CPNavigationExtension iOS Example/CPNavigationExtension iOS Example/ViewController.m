//
//  ViewController.m
//  CPNavigationExtension iOS Example
//
//  Created by caoping on 15/12/2016.
//  Copyright © 2016 caoping. All rights reserved.
//

#import "ViewController.h"
#import <CPNavigationExtension/CPNavigationExtension.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Controller1";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.cp_shadowImageHidden = YES;
    self.navigationItem.cp_tintColor = [UIColor whiteColor];
    self.navigationItem.cp_barTintColor = [UIColor orangeColor];
    self.navigationItem.cp_titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
}

@end
