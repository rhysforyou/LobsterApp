//
//  LAThemeManager.h
//  LobsterApp
//
//  Created by Rhys Powell on 17/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "LAThemeManager.h"
#import "LADefaultTheme.h"

@implementation LAThemeManager

+ (id <LATheme>)sharedTheme
{
    static id <LATheme> theme;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theme = [[LADefaultTheme alloc] init];
    });
    
    return theme;
}

+ (void)customizeAppearance
{
    id <LATheme> theme = [self sharedTheme];
    
    NSMutableDictionary *titleTextAttributes = [[NSMutableDictionary alloc] init];
    
    if ([theme textColor]) {
        titleTextAttributes[UITextAttributeTextColor] = [theme textColor];
    }
    
    if ([theme shadowColor]) {
        titleTextAttributes[UITextAttributeTextShadowColor] = [theme shadowColor];
    }
    
    if (!CGSizeEqualToSize([theme shadowOffset], CGSizeZero)) {
        titleTextAttributes[UITextAttributeTextShadowOffset] = [NSValue valueWithCGSize:[theme shadowOffset]];
    }
    
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setTintColor:[theme baseTintColor]];
    [navigationBarAppearance setTitleTextAttributes:titleTextAttributes];
    [navigationBarAppearance setBackgroundImage:[theme navigationBackgroundForBarMetrics:UIBarMetricsDefault] forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setBackgroundImage:[theme navigationBackgroundForBarMetrics:UIBarMetricsLandscapePhone] forBarMetrics:UIBarMetricsLandscapePhone];
    
    UIBarButtonItem *barButtonItemAppearance = [UIBarButtonItem appearance];
    [barButtonItemAppearance setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    
    [barButtonItemAppearance setBackgroundImage:[theme barButtonBackgroundForState:UIControlStateNormal style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault] forState:UIControlStateNormal style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault];
    [barButtonItemAppearance setBackgroundImage:[theme barButtonBackgroundForState:UIControlStateHighlighted style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault] forState:UIControlStateHighlighted style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault];
    [barButtonItemAppearance setBackgroundImage:[theme barButtonBackgroundForState:UIControlStateDisabled style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault] forState:UIControlStateDisabled style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault];
    
    [barButtonItemAppearance setBackgroundImage:[theme barButtonBackgroundForState:UIControlStateNormal style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsLandscapePhone] forState:UIControlStateNormal style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsLandscapePhone];
    [barButtonItemAppearance setBackgroundImage:[theme barButtonBackgroundForState:UIControlStateHighlighted style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsLandscapePhone] forState:UIControlStateHighlighted style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsLandscapePhone];
    [barButtonItemAppearance setBackgroundImage:[theme barButtonBackgroundForState:UIControlStateDisabled style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsLandscapePhone] forState:UIControlStateDisabled style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsLandscapePhone];
    
    [barButtonItemAppearance setBackButtonBackgroundImage:[theme backBarButtonBackgroundForState:UIControlStateNormal style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [barButtonItemAppearance setBackButtonBackgroundImage:[theme backBarButtonBackgroundForState:UIControlStateHighlighted style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    [barButtonItemAppearance setBackButtonBackgroundImage:[theme backBarButtonBackgroundForState:UIControlStateDisabled style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    
    [barButtonItemAppearance setBackButtonBackgroundImage:[theme backBarButtonBackgroundForState:UIControlStateNormal style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsLandscapePhone] forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    [barButtonItemAppearance setBackButtonBackgroundImage:[theme backBarButtonBackgroundForState:UIControlStateHighlighted style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsLandscapePhone] forState:UIControlStateHighlighted barMetrics:UIBarMetricsLandscapePhone];
    [barButtonItemAppearance setBackButtonBackgroundImage:[theme backBarButtonBackgroundForState:UIControlStateDisabled style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsLandscapePhone] forState:UIControlStateDisabled barMetrics:UIBarMetricsLandscapePhone];
}

+ (void)customizeView:(UIView *)view
{
    id <LATheme> theme = [self sharedTheme];
    
    UIColor *backgroundColor = [theme backgroundColor];
    if (backgroundColor != nil) {
        view.backgroundColor = backgroundColor;
    }
}


@end
