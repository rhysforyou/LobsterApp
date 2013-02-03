//
//  LAStoryDetailViewController.m
//  LobsterApp
//
//  Created by Rhys Powell on 5/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "LAStoryDetailViewController.h"
#import "LASlideUnderHeaderView.h"
#import "LAStoryPageViewController.h"
#import "LACommentCell.h"
#import "LAHTTPClient.h"
#import "Story.h"
#import "User.h"
#import "DTCoreText.h"

@interface LAStoryDetailViewController ()

@end

@implementation LAStoryDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self configureView];
    [self reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController class] == [LAStoryPageViewController class]) {
        [(LAStoryPageViewController *)segue.destinationViewController setStory:self.story];
    }
}

- (void)configureView
{
    self.storyNameLabel.text = self.story.title;
    self.submitterNameLabel.text = [NSString stringWithFormat:@"by %@", self.story.submitter.username];
    
    if ([self.story hoursSinceCreation] == 1) {
        self.postTimeLabel.text = @"1 hour ago";
    } else {
        self.postTimeLabel.text = [NSString stringWithFormat:@"%d hours ago", [self.story hoursSinceCreation]];
    }
}

- (void)reloadData
{
    [self.refreshControl beginRefreshing];
    [[LAHTTPClient sharedClinet] getStoryWithShortID:self.story.shortID success:^(AFJSONRequestOperation *operation, id responseObject) {
        NSDictionary *storyDict = (NSDictionary *)responseObject;
        [self.story unpackDictionary:storyDict];
        [self configureView];
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    } failure:^(AFJSONRequestOperation *operation, NSError *error) {
        NSLog(@"Error getting story %@: %@", self.story.shortID, error.localizedDescription);
        [self.refreshControl endRefreshing];
    }];
}

#pragma mark - Scroll view delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [(LASlideUnderHeaderView *)self.tableView.tableHeaderView handleScrollOffset:scrollView.contentOffset];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.story.comments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"commentCell";
    LACommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell configureWithComment:self.story.comments[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LACommentCell heightWithComment:self.story.comments[indexPath.row]];
}

#pragma mark - Attributed Text Content View Delegate

- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForLink:(NSURL *)url identifier:(NSString *)identifier frame:(CGRect)frame
{
	DTLinkButton *linkButton = [[DTLinkButton alloc] init];
	linkButton.URL = url;
	linkButton.GUID = identifier;
	linkButton.frame = frame;
	linkButton.minimumHitSize = CGSizeMake(25.0f, 25.0f);
	linkButton.showsTouchWhenHighlighted = YES;
	
	[linkButton addTarget:self action:@selector(linkTapped:) forControlEvents:UIControlEventTouchUpInside];
	
	return linkButton;
}

- (void)linkTapped:(DTLinkButton *)linkButton
{
	[[UIApplication sharedApplication] openURL:linkButton.URL];
}

@end
