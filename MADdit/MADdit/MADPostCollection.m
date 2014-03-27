//
//  MADPostCollection.m
//  MADdit
//
//  Created by Eddie Saenz on 3/26/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import "MADPostCollection.h"

static NSString* defaultQuery = @"all";

@implementation MADPostCollection

- (id)init {
    return [self initWithQuery:defaultQuery];
}

- (id)initWithQuery:(NSString * const)aQuery {
    self = [super init];
    if (self) {
        self.query = aQuery;
    }
    return self;
}

@end
