//
//  User.m
//  LobsterApp
//
//  Created by Rhys Powell on 4/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "User.h"
#import "Story.h"


@implementation User

@dynamic admin;
@dynamic avatarURL;
@dynamic moderator;
@dynamic username;
@dynamic posts;

+ (NSString *)entityName
{
    return @"User";
}

+ (instancetype)existingObjectWithDictionary:(NSDictionary *)dictionary context:(NSManagedObjectContext *)context
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [self entityWithContext:context];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"username = %@", dictionary[@"username"]];
    fetchRequest.fetchLimit = 1;
    
    NSArray *results = [context executeFetchRequest:fetchRequest error:nil];
    
    if ([results count] == 0) {
        return nil;
    }
    
    User *user = (User *)results[0];
    
    return user;
}

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.admin = dictionary[@"is_admin"];
    self.avatarURL = dictionary[@"avatar_url"];
    self.moderator = dictionary[@"is_moderator"];
    self.username = dictionary[@"username"];
}

@end
