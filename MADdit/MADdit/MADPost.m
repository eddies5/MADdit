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
    self.title = data[@"title"];
    self.subReddit = data[@"subreddit"];
    self.author = data[@"author"];
    self.text = data[@"selftext"];
    self.url = [NSURL URLWithString:data[@"url"]];
    self.score = (NSInteger) data[@"score"];
    
    // make thumbnail request
    if (![(NSString *)data[@"thumbnail"] isEqualToString:@"self"]) {
        NSString *urlString = [NSString stringWithFormat:@"%@", data[@"thumbnail"]];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLResponse *response = nil;
        NSError *error = nil;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        if (data == nil) {
            NSLog(@"%@", error);
        }
        
        self.thumbnail = [[UIImage alloc] initWithData:data];
    }
    
    return self;
}

@end
