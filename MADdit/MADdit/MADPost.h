//
//  MADPost.h
//  MADdit
//
//  Created by Eddie Saenz on 3/26/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MADPost : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* subReddit;
@property (strong, nonatomic) NSString* author;
@property (strong, nonatomic) NSString* text;

@end
