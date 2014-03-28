//
//  MADPostCollection.m
//  MADdit
//
//  Created by Eddie Saenz on 3/26/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import "MADPostCollection.h"

NSString* defaultQuery = @"all";

@implementation MADPostCollection

- (id)init
{
    return [self initWithQuery:defaultQuery];
}

- (id)initWithQuery:(NSString *)aQuery
{
    self = [super init];
    if (self) {
        self.query = aQuery;
    }
    [self makeRequest];
    return self;
}

- (void)makeRequest
{
    NSString* urlString = [NSString stringWithFormat:@"http://reddit.com/r/%@.json", self.query];
    NSLog(@"%@", urlString);
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLResponse* response = nil;
    NSError* error = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSData* jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:&error];
}

@end
