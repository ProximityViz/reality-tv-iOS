//
//  RecentItemsTableViewController.h
//  Reality TV Show Name Generator
//
//  Created by Mollie on 1/11/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecentItemsTableViewController : UITableViewController

@property (nonatomic) NSMutableArray *recentItems;
@property (strong, nonatomic) UIActivityViewController *activityViewController;

@end
