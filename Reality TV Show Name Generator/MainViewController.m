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
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

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
    
    self.drawerBottomConstraint.constant = -90;
    
    // animate button
    self.favoriteButton.adjustsImageWhenHighlighted = YES;
    self.favoriteButton.showsTouchWhenHighlighted = YES;
    [[self.favoriteButton imageView] setContentMode: UIViewContentModeScaleAspectFit];
    [self.favoriteButton setImage:[UIImage imageNamed:@"star-alt"] forState:UIControlStateHighlighted];
    self.shareButton.adjustsImageWhenHighlighted = YES;
    self.shareButton.showsTouchWhenHighlighted = YES;
    [[self.shareButton imageView] setContentMode: UIViewContentModeScaleAspectFit];
    [self.shareButton setImage:[UIImage imageNamed:@"share-alt"] forState:UIControlStateHighlighted];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.randomName = [[RandomName alloc] init];
    [self makeName];
    
    // set up data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.favorites = [[defaults arrayForKey:@"favorites"] mutableCopy];
    
}

- (IBAction)generateName {
    
    [self makeName];

}

- (IBAction)shareName:(id)sender {
    
    NSString *shareText = [NSString stringWithFormat:@"%@ %@ %@", @"Random Reality TV Show Name:", self.currentName, @"| Generate your own at http://www.realitytvgenerator.com/"];
    self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[shareText] applicationActivities:nil];
    [self presentViewController:self.activityViewController animated:YES completion:nil];
    
    self.drawerBottomConstraint.constant = -90;
    
}

- (IBAction)addFavorite:(id)sender {
//    [self.favoriteButton setImage:[UIImage animatedImageNamed:@"star-132-anim" duration:1.0] forState:UIControlStateHighlighted];
//    [self.favoriteButton setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
    
    // add to data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.favorites count] == 0) {
        self.favorites = [[NSMutableArray alloc] init];
    }
    
    // only add if not already favorited
    if (![self.favorites containsObject:self.currentName]) {
        
        [self.favorites addObject:self.currentName];
        [defaults setObject:self.favorites forKey:@"favorites"];
        
    }
    
    
}

- (IBAction)showHideDrawer:(id)sender {
    
    self.drawerBottomConstraint.constant = (self.drawerBottomConstraint.constant == -90) ? 0 : -90;
    
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

