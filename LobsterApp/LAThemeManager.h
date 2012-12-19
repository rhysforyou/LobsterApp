//
//  LAThemeManager.h
//  LobsterApp
//
//  Created by Rhys Powell on 17/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LATheme <NSObject>

- (UIColor *)mainColor;
- (UIColor *)highlightColour;
- (UIColor *)backgroundColor;
- (UIColor *)textColor;

- (UIColor *)shadowColor;
- (CGSize)shadowOffset;

- (UIColor *)baseTintColor;
- (UIColor *)accentTintColor;

- (UIImage *)navigationBackgroundForBarMetrics:(UIBarMetrics)barMetrics;
- (UIImage *)barButtonBackgroundForState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics;
- (UIImage *)backBarButtonBackgroundForState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics;

- (UIImage *)topShadowImage;
- (UIImage *)bottomShadowImage;

- (NSDictionary *)navigationBarTitleAttributes;

@end


@interface LAThemeManager : NSObject

+ (id <LATheme>)sharedTheme;

+ (void)customizeAppearance;

+ (void)customizeView:(UIView *)view;

@end
