//
//  Story.m
//  LobsterApp
//
//  Created by Rhys Powell on 19/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "Story.h"


@implementation Story

@dynamic commentCount;
@dynamic descriptionText;
@dynamic score;
@dynamic shortID;
@dynamic title;
@dynamic url;
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
}

@end
