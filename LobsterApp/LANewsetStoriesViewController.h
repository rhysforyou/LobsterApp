//
//  LANewsetStoriesViewController.h
//  LobsterApp
//
//  Created by Rhys Powell on 22/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LANewsetStoriesViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
