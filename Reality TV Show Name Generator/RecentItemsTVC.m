//
//  RecentItemsTVC.m
//  Reality TV Show Name Generator
//
//  Created by Mollie on 1/11/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "RecentItemsTVC.h"
#import "MainViewController.h"

@interface RecentItemsTVC ()

@property (strong, nonatomic) UIActivityViewController *activityViewController;

@end

@implementation RecentItemsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recentItems.count;
}

- (IBAction)doneWasPressed {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = self.recentItems[indexPath.row];
    
    return cell;
}

#pragma mark - Remove separator inset

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Remove separator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - Return to MainVC

// if user taps on a cell, they should be returned to the mainVC and see the name they tapped on, with the regular drawer options
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    
    if ([segue.identifier isEqualToString:@"showMain"]) {
        MainViewController *mVC = (MainViewController *)[segue destinationViewController];
        mVC.currentName = sender.textLabel.text;
        mVC.returningToMain = YES;
#warning Maybe there's a better way to do this?
        mVC.recentItems = self.recentItems;
        mVC.favorites = self.favorites;
    }
    
}


@end
