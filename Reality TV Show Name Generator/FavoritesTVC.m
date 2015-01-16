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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (IBAction)doneWasPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end
