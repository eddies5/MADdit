//
//  MADPost.m
//  MADdit
//
//  Created by Eddie Saenz on 3/26/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import "MADPost.h"

@implementation MADPost

- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    self.title = [[data objectForKey:@"data"] objectForKey:@"title"];
    self.subReddit = [[data objectForKey:@"data"] objectForKey:@"subreddit"];
    self.author = [[data objectForKey:@"data"] objectForKey:@"author"];
    self.text = [[data objectForKey:@"data"] objectForKey:@"selftext"];
    return self;
}

@end
