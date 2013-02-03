//
//  LACommentCell.m
//  LobsterApp
//
//  Created by Rhys Powell on 6/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "LACommentCell.h"
#import "Comment.h"
#import "User.h"
#import "DTCoreText.h"

@implementation LACommentCell

+ (CGFloat)heightWithComment:(Comment *)comment
{
    static UIFont *appFont;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appFont = [UIFont fontWithName:@"HelveticaNeue" size:14.0f];
    });
    
    CGFloat commentWidth = 320.0 - [comment.indentLevel integerValue] * 20.0f;
    
    CGSize commentTextSize = [comment.content sizeWithFont:appFont constrainedToSize:CGSizeMake(commentWidth, 10000.0) lineBreakMode:NSLineBreakByWordWrapping];
    
    return commentTextSize.height + 40.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithComment:(Comment *)comment
{
    self.commentTextIndentConstraint.constant = 20.0f * ([comment.indentLevel integerValue] - 1);
    self.titleTextIndentConstraint.constant = 20.0f * ([comment.indentLevel integerValue] - 1) + 10.0f;
    
    self.commentTextView.attributedString = comment.formattedContent;
    self.usernameLabel = [NSString stringWithFormat:@"by %@", comment.commentor.username];
    
    if (comment.hoursSinceCreation == 1) {
        self.timeLabel.text = @"1 hour ago";
    } else {
        self.timeLabel.text = [NSString stringWithFormat:@"%d hours ago", comment.hoursSinceCreation];
    }
}

@end
