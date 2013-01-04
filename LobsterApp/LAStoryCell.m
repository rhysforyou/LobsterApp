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
    static UILabel *dummyTitleLabel;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dummyTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 270.0f, 100.0f)];
        dummyTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17.0];
        dummyTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    });
    
    dummyTitleLabel.text = story.title;
    CGRect textRect = [dummyTitleLabel textRectForBounds:CGRectMake(0.0f, 0.0f, 270.0f, 100.0f) limitedToNumberOfLines:2];
    return textRect.size.height + 28.0f;
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
    NSLog(@"%@", self.storyTitleLabel.constraints);
    self.authorNameLabel.text = [NSString stringWithFormat:@"by %@", story.submitter.username];
    
    if ([story.commentCount isEqual: @1]) {
        self.commentCountLabel.text = @"1 comment";
    } else {
        self.commentCountLabel.text = [NSString stringWithFormat:@"%@ comments", story.commentCount];
    }
}

@end
