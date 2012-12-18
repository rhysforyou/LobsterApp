//
//  LAMasterViewController.h
//  LobsterApp
//
//  Created by Rhys Powell on 18/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface LAMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
