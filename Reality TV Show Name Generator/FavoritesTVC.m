//
//  FavoritesTVC.m
//  Reality TV Show Name Generator
//
//  Created by Mollie on 1/16/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "FavoritesTVC.h"
#import "MainViewController.h"

@interface FavoritesTVC ()

@property (strong, nonatomic) UIActivityViewController *activityViewController;

@end

@implementation FavoritesTVC

- (void)viewDidLoad {

    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.favorites.count;

}

- (IBAction)doneWasPressed:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = self.favorites[indexPath.row];
    
    return cell;
}

# pragma  mark - Swipe to delete

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.favorites removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
    
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
        mVC.recentItems = self.recentItems;
        mVC.favorites = self.favorites;
    }
    
}


@end
