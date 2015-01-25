//
//  MainViewController.h
//  Reality TV Show Name Generator
//
//  Created by Mollie on 12/6/14.
//  Copyright (c) 2014 Proximity Viz LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RandomName;

@interface MainViewController : UIViewController

@property (weak, nonatomic) NSString *currentName;
@property (nonatomic) BOOL returningToMain;
@property (nonatomic) NSMutableArray *favorites;
@property (nonatomic) NSMutableArray *recentItems;


@end

