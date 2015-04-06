//
//  InterfaceController.m
//  Reality TV Name Generator WatchKit Extension
//
//  Created by Mollie on 4/5/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "InterfaceController.h"
#import "RandomName.h"


@interface InterfaceController()

@property (strong, nonatomic) RandomName *randomName;

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *tvShowLabel;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [self generateName];
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)generateName {
    
    self.currentName = [[[RandomName alloc] init] createName];
    
    [self.tvShowLabel setText:self.currentName];
    
}

@end



