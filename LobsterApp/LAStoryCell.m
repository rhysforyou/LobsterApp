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

+ (CGFloat)cellHeight
{
    return 51.0;
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
    self.authorNameLabel.text = [NSString stringWithFormat:@"Posted by %@", story.submitter.username];
    
    if ([story.commentCount isEqual: @1]) {
        self.commentCountLabel.text = @"1 comment";
    } else {
        self.commentCountLabel.text = [NSString stringWithFormat:@"%@ comments", story.commentCount];
    }
}

@end
