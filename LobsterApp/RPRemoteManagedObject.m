//
//  RPRemoteManagedObject.m
//  LobsterApp
//
//  Created by Rhys Powell on 19/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "RPRemoteManagedObject.h"

@implementation RPRemoteManagedObject

+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary
{
    return [self objectWithDictionary:dictionary context:[self mainContext]];
}

+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary context:(NSManagedObjectContext *)context
{
    RPRemoteManagedObject *object = [self existingObjectWithDictionary:dictionary context:context];
    
    if (object == nil) {
        object = [[self alloc] initWithContext:context];
    }
    
    if ([object shouldUnpackDictionary:dictionary]) {
        [object unpackDictionary:dictionary];
    }
    
    return object;
}

+ (instancetype)existingObjectWithDictionary:(NSDictionary *)dictionary
{
    return [self existingObjectWithDictionary:dictionary context:[self mainContext]];
}

+ (instancetype)existingObjectWithDictionary:(NSDictionary *)dictionary context:(NSManagedObjectContext *)context
{
    // Override this
    return nil;
}

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    // Override this
}

- (BOOL)shouldUnpackDictionary:(NSDictionary *)dictionary
{
    // Override this
    return YES;
}



@end
