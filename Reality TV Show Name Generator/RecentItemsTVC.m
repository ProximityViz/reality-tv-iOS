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

@end

@implementation RecentItemsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    // Return the number of rows in the section.
//    return self.recentItems.count;
    return self.recentItems.count;
}

- (IBAction)doneWasPressed {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = self.recentItems[indexPath.row];
    
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ios7-upload-outline"]];
    
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


#pragma mark - Share

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // share
    NSString *shareText = [NSString stringWithFormat:@"%@ %@ %@", @"Random Reality TV Show Name:", self.recentItems[indexPath.row], @"| Generate your own at http://www.realitytvgenerator.com/"];
    self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[shareText] applicationActivities:nil];
    [self presentViewController:self.activityViewController animated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
