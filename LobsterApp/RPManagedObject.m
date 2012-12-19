//
//  RPManagedObject.m
//  LobsterApp
//
//  Created by Rhys Powell on 18/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "RPManagedObject.h"

static NSManagedObjectContext *__managedObjectContext = nil;
static NSDictionary *__persistentStoreOptions = nil;
static NSManagedObjectModel *__managedObjectModel = nil;
static NSURL *__persistentStoreURL;

@implementation RPManagedObject

+ (NSManagedObjectContext *)mainContext
{
    if (__managedObjectContext == nil) {
        __managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        __managedObjectContext.persistentStoreCoordinator = [self persistentStoreCoordinator];
    }
    
    return __managedObjectContext;
}

+ (BOOL)hasMainContext
{
    return __managedObjectContext != nil;
}

+ (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    static NSPersistentStoreCoordinator *persistentStoreCoordinator = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSManagedObjectModel *model = [self managedObjectModel];
        persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        
        NSURL *url = [self persistentStoreURL];
        NSDictionary *options = [self persistentStoreOptions];
        NSError *error = nil;
        
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:options error:&error];
        if (error) {
            NSLog(@"Error setting persistent store: %@", error.localizedDescription);
        }
    });
    
    return persistentStoreCoordinator;
}

+ (NSDictionary *)persistentStoreOptions
{
    if (__persistentStoreOptions == nil) {
        __persistentStoreOptions = @{
            NSMigratePersistentStoresAutomaticallyOption : @YES,
            NSInferMappingModelAutomaticallyOption : @YES
        };
    }
    
    return __persistentStoreOptions;
}

+ (void)setPersistentStoreOptions:(NSDictionary *)options
{
    __persistentStoreOptions = options;
}

+ (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel == nil) {
        NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        if (!model) {
            [[NSException exceptionWithName:@"RPManagedObjectMissingModel" reason:@"You need to provide a managed model" userInfo:nil] raise];
            return nil;
        }
        
        [self setManagedObjectModel:model];
    }
    
    return __managedObjectModel;
}

+ (void)setManagedObjectModel:(NSManagedObjectModel *)model
{
    __managedObjectModel = model;
}

+ (NSURL *)persistentStoreURL
{
    if (__persistentStoreURL == nil) {
        NSDictionary *applicationData = [[NSBundle mainBundle] infoDictionary];
        NSString *applicationName = applicationData[@"CFBundleDisplayName"];
        NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSURL *url = [documentsURL URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite", applicationName]];
        
        [self setPersistentStoreURL:url];
    }
    
    return __persistentStoreURL;
}

+ (void)setPersistentStoreURL:(NSURL *)url
{
    __persistentStoreURL = url;
}

+ (NSString *)entityName
{
    return NSStringFromClass(self);
}

+ (NSEntityDescription *)entity
{
    return [self entityWithContext:nil];
}

+ (NSEntityDescription *)entityWithContext:(NSManagedObjectContext *)context
{
    if (context == nil) {
        context = [self mainContext];
    }
    
    return [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:context];
}

+ (NSArray *)defaultSortDescriptors
{
    return nil;
}

- (id)init
{
    return [self initWithContext:nil];
}

- (instancetype)initWithContext:(NSManagedObjectContext *)context
{
    if (context == nil) {
        context = [[self class] mainContext];
    }
    
    NSEntityDescription *entity = [[self class] entityWithContext:context];
    self = [self initWithEntity:entity insertIntoManagedObjectContext:context];

    return self;
}

@end
