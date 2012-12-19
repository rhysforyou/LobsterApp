//
//  Story.h
//  LobsterApp
//
//  Created by Rhys Powell on 19/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "RPRemoteManagedObject.h"

@interface Story : RPRemoteManagedObject

@property (nonatomic, retain) NSNumber * commentCount;
@property (nonatomic, retain) NSString * descriptionText;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSString * shortID;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSManagedObject *submitter;

@end
