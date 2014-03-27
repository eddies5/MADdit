//
//  MADPostCollection.h
//  MADdit
//
//  Created by Eddie Saenz on 3/26/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MADPostCollection : NSObject

@property (strong, nonatomic) NSString* query;
@property (strong, nonatomic) NSMutableArray* posts;

- (id)init;
- (id)initWithQuery:(NSString* const)aQuery;

@end
