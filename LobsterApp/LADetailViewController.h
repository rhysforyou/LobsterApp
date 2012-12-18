//
//  LADetailViewController.h
//  LobsterApp
//
//  Created by Rhys Powell on 18/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LADetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
