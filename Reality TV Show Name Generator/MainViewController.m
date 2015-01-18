//
//  MainViewController.m
//  Reality TV Show Name Generator
//
//  Created by Mollie on 12/6/14.
//  Copyright (c) 2014 Proximity Viz LLC. All rights reserved.
//

#import "MainViewController.h"
#import "RandomName.h"
#import "RecentItemsTVC.h"
#import "FavoritesTVC.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *drawerBottomConstraint;
@property (strong, nonatomic) IBOutlet UILabel *tvShowLabel;
@property (strong, nonatomic) RandomName *randomName;
@property (strong, nonatomic) UIActivityViewController *activityViewController;

@end

@implementation MainViewController

#pragma mark - Random Name

- (void) makeName {
    if (!self.recentItems) {
        self.recentItems = [[NSMutableArray alloc] init];
    }
    
    // if we are returning to main from favorites or recent items, we want to display the returned name instead of a random name
    if (self.returningToMain) {
        self.returningToMain = NO;
    } else {
        self.currentName = [self.randomName createName];
        [self.recentItems addObject:self.currentName];
    }
    self.tvShowLabel.text = self.currentName;
}

- (void)viewWillAppear:(BOOL)animated {
    
    if (!self.favorites) {
        self.favorites = [[NSMutableArray alloc] init];
    }
    
    self.drawerBottomConstraint.constant = -136 + 46;
    
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
    self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[shareText] applicationActivities:nil];
    [self presentViewController:self.activityViewController animated:YES completion:nil];
}

- (IBAction)addFavorite:(id)sender {
    
    [self.favorites addObject:self.currentName];
    
}

- (IBAction)showHideDrawer:(id)sender {
    
    self.drawerBottomConstraint.constant = (self.drawerBottomConstraint.constant == -136 + 46) ? 0 : -136 + 46;
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecentItems"]) {
        UINavigationController *navController = (UINavigationController *)[segue destinationViewController];
        RecentItemsTVC *recentItemsTVC = (RecentItemsTVC *) navController.topViewController;
        recentItemsTVC.favorites = self.favorites;
        recentItemsTVC.recentItems = self.recentItems;
    } else if ([segue.identifier isEqualToString:@"showFavorites"]) {
        UINavigationController *navController = (UINavigationController *) [segue destinationViewController];
        
        FavoritesTVC *favoritesTVC = (FavoritesTVC *) navController.topViewController;
        favoritesTVC.favorites = self.favorites;
        favoritesTVC.recentItems = self.recentItems;
    }
}

@end

