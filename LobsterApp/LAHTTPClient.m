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

- (void)getHottestStoriesWithSuccess:(LAHTTPClientSuccess)success failure:(LAHTTPClientFailure)failure
{
    [self getPath:@"hottest.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success((AFJSONRequestOperation *)operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure((AFJSONRequestOperation *) operation, error);
        }
    }];
}

- (void)getNewestStoriesWithSuccess:(LAHTTPClientSuccess)success failure:(LAHTTPClientFailure)failure
{
    [self getPath:@"newest.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success((AFJSONRequestOperation *)operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure((AFJSONRequestOperation *)operation, error);
        }
    }];
}

- (void)getStoryWithShortID:(NSString *)shortID success:(LAHTTPClientSuccess)success failure:(LAHTTPClientFailure)failure;
{
    NSString *path = [NSString stringWithFormat:@"/s/%@", shortID];
    
    [self getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success((AFJSONRequestOperation *)operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure((AFJSONRequestOperation *)operation, error);
        }
    }];
}

@end
