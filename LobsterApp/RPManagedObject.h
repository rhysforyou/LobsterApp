//
//  RPManagedObject.h
//  LobsterApp
//
//  Created by Rhys Powell on 18/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface RPManagedObject : NSManagedObject

// Accessing the Main Context
+ (NSManagedObjectContext *)mainContext;
+ (BOOL)hasMainContext;

// Configuring the Persistent Store
+ (NSPersistentStoreCoordinator *)persistentStoreCoordinator;
+ (NSDictionary *)persistentStoreOptions;
+ (void)setPersistentStoreOptions:(NSDictionary *)options;
+ (NSManagedObjectModel *)managedObjectModel;
+ (void)setManagedObjectModel:(NSManagedObjectModel *)model;
+ (NSURL *)persistentStoreURL;
+ (void)setPersistentStoreURL:(NSURL *)url;

// Getting Entity Information
+ (NSString *)entityName;
+ (NSEntityDescription *)entity;
+ (NSEntityDescription *)entityWithContext:(NSManagedObjectContext *)context;
+ (NSArray *)defaultSortDescriptors;

// Initializing
- (instancetype)initWithContext:(NSManagedObjectContext *)context;

@end
