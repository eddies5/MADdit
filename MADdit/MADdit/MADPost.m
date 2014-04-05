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
    self.title = data[@"data"][@"title"];
    self.subReddit = data[@"data"][@"subreddit"];
    self.author = data[@"data"][@"author"];
    self.text = data[@"data"][@"selftext"];
    self.url = [NSURL URLWithString:data[@"url"]];
    self.score = (NSInteger) data[@"score"];
    return self;
}

@end
