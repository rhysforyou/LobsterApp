//
//  LAStoryDetailViewController.h
//  LobsterApp
//
//  Created by Rhys Powell on 5/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Story;

@interface LAStoryDetailViewController : UITableViewController

@property (nonatomic, strong) Story *story;

@end
