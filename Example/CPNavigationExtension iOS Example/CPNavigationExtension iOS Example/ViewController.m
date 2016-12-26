//
//  ViewController.m
//  CPNavigationExtension iOS Example
//
//  Created by caoping on 15/12/2016.
//  Copyright © 2016 caoping. All rights reserved.
//

#import "ViewController.h"
#import <CPNavigationExtension/CPNavigationExtension.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myCell"];
    
    self.title = @"Controller1";
    self.view.backgroundColor = [UIColor whiteColor];
    
    CPNavigationBarAppearanceInfo *info = [CPNavigationBarAppearanceInfo new];
    info.shadowImage = [UIImage imageNamed:@"asset-ios-navigationbar-shadow"];
    info.tintColor = [UIColor whiteColor];
    info.barTintColor = [UIColor orangeColor];
    self.cp_navigationBarAppearanceInfo = info;
    info.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    cell.textLabel.text = @"myCell";
    cell.textLabel.backgroundColor = [UIColor redColor];
    return cell;
}

@end
