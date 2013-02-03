//
//  Comment.m
//  LobsterApp
//
//  Created by Rhys Powell on 6/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "Comment.h"
#import "Story.h"
#import "User.h"

#import "DTCoreText.h"
#import "NSDate+LAAdditions.h"

@implementation Comment

@dynamic content;
@dynamic creationDate;
@dynamic updatedDate;
@dynamic score;
@dynamic shortID;
@dynamic indentLevel;
@dynamic story;
@dynamic commentor;

+ (NSString *)entityName
{
    return @"Comment";
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
    
    Comment *comment = (Comment *)results[0];
    
    return comment;
}

- (BOOL)shouldUnpackDictionary:(NSDictionary *)dictionary
{
    NSDate *updatedAt = [NSDate parseDate:dictionary[@"updated_at"]];
    return ![updatedAt isEqualToDate:self.updatedDate];
}

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.content = dictionary[@"comment"];
    self.creationDate = [NSDate parseDate:dictionary[@"created_at"]];
    self.updatedDate = [NSDate parseDate:dictionary[@"updated_at"]];
    self.score = dictionary[@"score"];
    self.shortID = dictionary[@"short_id"];
    self.indentLevel = dictionary[@"indent_level"];
    
    self.commentor = [User objectWithDictionary:dictionary[@"commenting_user"] context:self.managedObjectContext];
}

- (NSInteger)hoursSinceCreation
{
    NSTimeInterval timeSinceCreation = [[NSDate date] timeIntervalSinceDate:self.creationDate];
    NSInteger hoursSinceCreation = timeSinceCreation / (60 * 60);
    
    return hoursSinceCreation;
}

- (NSAttributedString *)formattedContent
{
	NSData *htmlData = [self.content dataUsingEncoding:NSUTF8StringEncoding];
	NSDictionary *options = @{DTDefaultFontFamily : @"Helvetica Neue"};
	NSAttributedString *formattedContent = [[NSAttributedString alloc] initWithHTMLData:htmlData
																				options:options
																	 documentAttributes:nil];
	
	return formattedContent;
}

@end
