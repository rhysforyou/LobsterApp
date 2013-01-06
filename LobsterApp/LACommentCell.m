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

@implementation LACommentCell

+ (CGFloat)heightWithComment:(Comment *)comment
{
    static UIFont *appFont;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appFont = [UIFont fontWithName:@"HelveticaNeue" size:15.0f];
    });
    
    CGSize commentTextSize = [comment.content sizeWithFont:appFont constrainedToSize:CGSizeMake(300.0, 10000.0) lineBreakMode:NSLineBreakByWordWrapping];
    
    NSLog(@"Comment text size: %f, %f", commentTextSize.height, commentTextSize.width);
    
    return commentTextSize.height + 35.0f;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.commentTextView.contentInset = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithComment:(Comment *)comment
{
    self.commentTextView.text = comment.content;
    self.usernameLabel = [NSString stringWithFormat:@"by %@", comment.commentor.username];
    
    if (comment.hoursSinceCreation == 1) {
        self.timeLabel.text = @"1 hour ago";
    } else {
        self.timeLabel.text = [NSString stringWithFormat:@"%d hours ago", comment.hoursSinceCreation];
    }
}

@end
