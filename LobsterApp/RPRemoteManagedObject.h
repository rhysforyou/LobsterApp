//
//  RPRemoteManagedObject.h
//  LobsterApp
//
//  Created by Rhys Powell on 19/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "RPManagedObject.h"

@interface RPRemoteManagedObject : RPManagedObject

+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary context:(NSManagedObjectContext *)context;

+ (instancetype)existingObjectWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)existingObjectWithDictionary:(NSDictionary *)dictionary context:(NSManagedObjectContext *)context;

// Override these in your subclass
- (void)unpackDictionary:(NSDictionary *)dictionary;
- (BOOL)shouldUnpackDictionary:(NSDictionary *)dictionary;

@end
