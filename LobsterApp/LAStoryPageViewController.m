//
//  LAStoryPageViewController.m
//  LobsterApp
//
//  Created by Rhys Powell on 22/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "LAStoryPageViewController.h"
#import "Story.h"

@interface LAStoryPageViewController ()

@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSURL *currentURL;

@end

@implementation LAStoryPageViewController

- (void)viewDidLoad
{
    self.webView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.currentURL]];
}

- (void)setStory:(Story *)story
{
    _story = story;
    
    NSLog(@"Loading: %@", story.url);
    self.currentURL = [NSURL URLWithString:story.url];
}

@end
