//
//  ViewController.m
//  Reality TV Show Name Generator
//
//  Created by Mollie on 12/6/14.
//  Copyright (c) 2014 Proximity Viz LLC. All rights reserved.
//

#import "ViewController.h"
#import "RandomName.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Random Name

- (void) makeName {
    self.currentName = [self.randomName createName];
    self.tvShowLabel.text = self.currentName;
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
    self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[self.currentName] applicationActivities:nil];
    [self presentViewController:self.activityViewController animated:YES completion:nil];
}
@end

