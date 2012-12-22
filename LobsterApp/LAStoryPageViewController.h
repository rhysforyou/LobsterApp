//
//  LAStoryPageViewController.h
//  LobsterApp
//
//  Created by Rhys Powell on 22/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Story;

@interface LAStoryPageViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) Story *story;

@end
