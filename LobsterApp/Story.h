//
//  Story.h
//  LobsterApp
//
//  Created by Rhys Powell on 6/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "RPRemoteManagedObject.h"

@class Comment, User;

@interface Story : RPRemoteManagedObject

@property (nonatomic, retain) NSNumber * commentCount;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) NSString * descriptionText;
@property (nonatomic, retain) NSNumber * rank;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSString * shortID;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) User *submitter;
@property (nonatomic, retain) NSOrderedSet *comments;

@property (readonly) NSInteger hoursSinceCreation;

@end

@interface Story (CoreDataGeneratedAccessors)

// WARNING: There's a huge bug in Core Data that means these are mostly broken, use at your own peril
- (void)insertObject:(Comment *)value inCommentsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromCommentsAtIndex:(NSUInteger)idx;
- (void)insertComments:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeCommentsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInCommentsAtIndex:(NSUInteger)idx withObject:(Comment *)value;
- (void)replaceCommentsAtIndexes:(NSIndexSet *)indexes withComments:(NSArray *)values;
- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSOrderedSet *)values;
- (void)removeComments:(NSOrderedSet *)values;
@end
