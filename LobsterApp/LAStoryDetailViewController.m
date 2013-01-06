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
#import "LAHTTPClient.h"
#import "Story.h"
#import "User.h"

@interface LAStoryDetailViewController ()

@end

@implementation LAStoryDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
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
    [[LAHTTPClient sharedClinet] getStoryWithShortID:self.story.shortID success:^(AFJSONRequestOperation *operation, id responseObject) {
        NSDictionary *storyDict = (NSDictionary *)responseObject;
        [self.story unpackDictionary:storyDict];
        for (Comment *comment in self.story.comments) {
            NSLog(@"??? %@", comment);
        }
    } failure:^(AFJSONRequestOperation *operation, NSError *error) {
        NSLog(@"Error getting story %@: %@", self.story.shortID, error.localizedDescription);
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
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
