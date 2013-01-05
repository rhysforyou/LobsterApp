//
//  LAStoryCell.m
//  LobsterApp
//
//  Created by Rhys Powell on 4/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "LAStoryCell.h"
#import "Story.h"
#import "User.h"

@implementation LAStoryCell

+ (CGFloat)cellHeightWithStory:(Story *)story
{
    static UIFont *appFont;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appFont = [UIFont fontWithName:@"HelveticaNeue" size:17.0f];
    });
    
    CGSize titleSize = [story.title sizeWithFont:appFont constrainedToSize:CGSizeMake(290.0f, 100.0f) lineBreakMode:NSLineBreakByWordWrapping];
    return titleSize.height + 28.0f;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithStory:(Story *)story
{
    self.storyTitleLabel.text = story.title;
    self.authorNameLabel.text = [NSString stringWithFormat:@"by %@", story.submitter.username];
    
    if ([story.commentCount isEqual: @1]) {
        self.commentCountLabel.text = @"1 comment";
    } else {
        self.commentCountLabel.text = [NSString stringWithFormat:@"%@ comments", story.commentCount];
    }
}

@end
