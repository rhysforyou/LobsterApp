//
//  LAHTTPClient.m
//  LobsterApp
//
//  Created by Rhys Powell on 19/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "LAHTTPClient.h"

@implementation LAHTTPClient

+ (instancetype)sharedClinet
{
    static LAHTTPClient *sharedClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[LAHTTPClient alloc] init];
    });
    
    return sharedClient;
}

- (id)init
{
    NSURL *baseURL = [NSURL URLWithString:@"http://lobste.rs/"];
    self = [super initWithBaseURL:baseURL];
    
    if (self) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    
    return self;
}

@end
