//
//  User.h
//  LobsterApp
//
//  Created by Rhys Powell on 6/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "RPRemoteManagedObject.h"

@class Comment, Story;

@interface User : RPRemoteManagedObject

@property (nonatomic, retain) NSNumber * admin;
@property (nonatomic, retain) NSString * avatarURL;
@property (nonatomic, retain) NSNumber * moderator;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSSet *posts;
@property (nonatomic, retain) NSSet *comments;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addPostsObject:(Story *)value;
- (void)removePostsObject:(Story *)value;
- (void)addPosts:(NSSet *)values;
- (void)removePosts:(NSSet *)values;

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end
