//
//  Story.m
//  LobsterApp
//
//  Created by Rhys Powell on 19/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "Story.h"
#import "User.h"
#import "NSDate+LAAdditions.h"

@implementation Story

@dynamic commentCount;
@dynamic descriptionText;
@dynamic score;
@dynamic shortID;
@dynamic title;
@dynamic url;
@dynamic rank;
@dynamic creationDate;
@dynamic submitter;

+ (NSString *)entityName
{
    return @"Story";
}

+ (instancetype)existingObjectWithDictionary:(NSDictionary *)dictionary context:(NSManagedObjectContext *)context
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [self entityWithContext:context];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"shortID = %@", dictionary[@"short_id"]];
    fetchRequest.fetchLimit = 1;
    
    NSArray *results = [context executeFetchRequest:fetchRequest error:nil];
    
    if ([results count] == 0) {
        return nil;
    }
    
    Story *story = (Story *)results[0];
    
    return story;
}

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.commentCount = dictionary[@"comment_count"];
    self.descriptionText = dictionary[@"description"];
    self.score = dictionary[@"score"];
    self.shortID = dictionary[@"short_id"];
    self.title = dictionary[@"title"];
    self.url = dictionary[@"url"];
    self.creationDate = [NSDate parseDate:dictionary[@"created_at"]];
    
    self.submitter = [User objectWithDictionary:dictionary[@"submitter_user"] context:self.managedObjectContext];
}

- (NSInteger)hoursSinceCreation
{
    NSTimeInterval timeSinceCreation = [[NSDate date] timeIntervalSinceDate:self.creationDate];
    NSInteger hoursSinceCreation = timeSinceCreation / (60 * 60);
    
    return hoursSinceCreation;
}

@end
