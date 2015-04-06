//
//  InterfaceController.h
//  Reality TV Name Generator WatchKit Extension
//
//  Created by Mollie on 4/5/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@class RandomName;

@interface InterfaceController : WKInterfaceController

@property (weak, nonatomic) NSString *currentName;

@end
