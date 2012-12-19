//
//  LAHTTPClient.h
//  LobsterApp
//
//  Created by Rhys Powell on 19/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "AFNetworking.h"

@interface LAHTTPClient : AFHTTPClient

+ (instancetype)sharedClinet;

@end
