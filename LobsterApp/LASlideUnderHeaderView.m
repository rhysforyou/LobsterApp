//
//  LASlideUnderHeaderView.m
//  LobsterApp
//
//  Created by Rhys Powell on 5/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "LASlideUnderHeaderView.h"

@interface LASlideUnderHeaderView ()

@property (nonatomic) CGFloat offscreenHeight;

@end

@implementation LASlideUnderHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundView = [[UIView alloc] initWithFrame:frame];
        [self addSubview:_backgroundView];
        
        UIImage *shadowImage = [UIImage imageNamed:@"bottomShadow"];
        UIImageView *shadowImageView = [[UIImageView alloc] initWithImage:shadowImage];
        CGRect shadowFrame = shadowImageView.frame;
        shadowFrame.size.width = 320.0f;
        shadowFrame.origin.x = 0.0f;
        shadowFrame.origin.y = frame.size.height - shadowFrame.size.height;
        shadowImageView.frame = shadowFrame;
        [self addSubview:shadowImageView];
        
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)handleScrollOffset:(CGPoint)offset
{
    if (offset.y < 0) {
        offset.y = 0;
    }
    
    if (offset.y > self.offscreenHeight) {
        CGRect backgroundFrame = self.backgroundView.frame;
        
        offset.y -= self.offscreenHeight;
        backgroundFrame.origin = offset;
        self.backgroundView.frame = backgroundFrame;
    }
}

- (CGFloat)offscreenHeight
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _offscreenHeight = self.frame.size.height - self.superview.frame.size.height;
        if (_offscreenHeight < 0.0f) _offscreenHeight = 0.0f;
    });
    
    return _offscreenHeight;
}

@end
