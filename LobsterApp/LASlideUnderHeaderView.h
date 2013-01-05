//
//  LASlideUnderHeaderView.h
//  LobsterApp
//
//  Created by Rhys Powell on 5/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LASlideUnderHeaderView : UIView

@property (nonatomic, strong) IBOutlet UIView *backgroundView;

- (void)handleScrollOffset:(CGPoint)offset;

@end
