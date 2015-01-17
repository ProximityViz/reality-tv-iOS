//
//  FavoritesData.m
//  Reality TV Show Name Generator
//
//  Created by Mollie on 1/17/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "FavoritesData.h"

@implementation FavoritesData

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.favorite = [aDecoder decodeObjectForKey:@"favorite"];
    
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.favorite forKey:@"favorite"];

}


@end
