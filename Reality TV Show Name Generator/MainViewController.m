//
//  MainViewController.m
//  Reality TV Show Name Generator
//
//  Created by Mollie on 12/6/14.
//  Copyright (c) 2014 Proximity Viz LLC. All rights reserved.
//

#import "MainViewController.h"
#import "RandomName.h"
#import "RecentItemsTableViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - Random Name

- (void) makeName {
    if (!self.recentItems) {
        self.recentItems = [[NSMutableArray alloc] init];
    }
    self.currentName = [self.randomName createName];
    self.tvShowLabel.text = self.currentName;
    [self.recentItems addObject:self.currentName];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.randomName = [[RandomName alloc] init];
    [self makeName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)generateName {
    [self makeName];
}

- (IBAction)shareName:(id)sender {
    NSString *shareText = [NSString stringWithFormat:@"%@ %@ %@", @"Random Reality TV Show Name:", self.currentName, @"| Generate your own at http://www.realitytvgenerator.com/"];
    NSLog(@"%@", shareText);
    self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[shareText] applicationActivities:nil];
    [self presentViewController:self.activityViewController animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecentItems"]) {
        UINavigationController *navController = (UINavigationController *)[segue destinationViewController];
        RecentItemsTableViewController *recentItemsTVC = [navController topViewController];
        recentItemsTVC.recentItems = self.recentItems;
    }
}

@end

