//
//  LACommentCell.h
//  LobsterApp
//
//  Created by Rhys Powell on 6/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Comment, DTAttributedTextContentView;

@interface LACommentCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet DTAttributedTextContentView *commentTextView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *commentTextIndentConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titleTextIndentConstraint;

+ (CGFloat)heightWithComment:(Comment *)comment;

- (void)configureWithComment:(Comment *)comment;

@end
