//
//  LAHTTPClient.h
//  LobsterApp
//
//  Created by Rhys Powell on 19/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "AFNetworking.h"

typedef void (^LAHTTPClientSuccess)(AFJSONRequestOperation *operation, id responseObject);
typedef void (^LAHTTPClientFailure)(AFJSONRequestOperation *operation, NSError *error);

@interface LAHTTPClient : AFHTTPClient

+ (instancetype)sharedClinet;

- (void)getHottestStoriesWithSuccess:(LAHTTPClientSuccess)success failure:(LAHTTPClientFailure)failure;

@end
