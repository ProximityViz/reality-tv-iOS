//
//  RandomName.h
//  Reality TV Show Name Generator
//
//  Created by Mollie on 12/6/14.
//  Copyright (c) 2014 Proximity Viz LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomName : NSObject

@property (strong, nonatomic) NSArray *firstNames;
@property (strong, nonatomic) NSArray *secondNames;

- (NSString*) createName;

@end
