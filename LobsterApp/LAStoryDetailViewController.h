//
//  LAStoryDetailViewController.h
//  LobsterApp
//
//  Created by Rhys Powell on 5/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Story;
@protocol DTAttributedTextContentViewDelegate;

@interface LAStoryDetailViewController : UITableViewController <DTAttributedTextContentViewDelegate>

@property (nonatomic, strong) Story *story;

@property (nonatomic, strong) IBOutlet UILabel *storyNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *submitterNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *postTimeLabel;

@end
