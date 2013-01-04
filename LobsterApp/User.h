//
//  User.h
//  LobsterApp
//
//  Created by Rhys Powell on 4/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Story;

@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * admin;
@property (nonatomic, retain) NSString * avatarURL;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * moderator;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSSet *posts;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addPostsObject:(Story *)value;
- (void)removePostsObject:(Story *)value;
- (void)addPosts:(NSSet *)values;
- (void)removePosts:(NSSet *)values;

@end
