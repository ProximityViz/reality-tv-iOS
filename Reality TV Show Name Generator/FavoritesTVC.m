//
//  FavoritesTVC.m
//  Reality TV Show Name Generator
//
//  Created by Mollie on 1/16/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "FavoritesTVC.h"

@interface FavoritesTVC ()

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
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    // share
//    NSString *shareText = [NSString stringWithFormat:@"%@ %@ %@", @"Random Reality TV Show Name:", self.recentItems[indexPath.row], @"| Generate your own at http://www.realitytvgenerator.com/"];
//    self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[shareText] applicationActivities:nil];
//    [self presentViewController:self.activityViewController animated:YES completion:nil];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}


@end
