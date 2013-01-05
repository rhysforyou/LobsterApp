//
//  Comment.h
//  LobsterApp
//
//  Created by Rhys Powell on 6/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "RPRemoteManagedObject.h"

@class Story, User;

@interface Comment : RPRemoteManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) NSDate * updatedDate;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSString * shortID;
@property (nonatomic, retain) NSNumber * indentLevel;
@property (nonatomic, retain) Story *story;
@property (nonatomic, retain) User *commentor;

@end
