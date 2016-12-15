//
//  TableViewController.m
//  CPNavigationExtension iOS Example
//
//  Created by caoping on 15/12/2016.
//  Copyright © 2016 caoping. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import <CPNavigationExtension/CPNavigationExtension.h>

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myCell"];
    self.navigationItem.cp_shadowImageHidden = YES;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewController *controller = [[ViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController showViewController:controller sender:nil];
}

@end
