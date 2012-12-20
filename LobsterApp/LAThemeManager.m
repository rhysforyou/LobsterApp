//
//  LAThemeManager.h
//  LobsterApp
//
//  Created by Rhys Powell on 17/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "LAThemeManager.h"
#import "LAReddishTheme.h"

@implementation LAThemeManager

+ (id <LATheme>)sharedTheme
{
    static id <LATheme> theme;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theme = [[LAReddishTheme alloc] init];
    });
    
    return theme;
}

+ (void)customizeAppearance
{
    id <LATheme> theme = [self sharedTheme];
    
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setTintColor:[theme baseTintColor]];
    [navigationBarAppearance setBackgroundImage:[theme navigationBackgroundForBarMetrics:UIBarMetricsDefault] forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setBackgroundImage:[theme navigationBackgroundForBarMetrics:UIBarMetricsLandscapePhone] forBarMetrics:UIBarMetricsLandscapePhone];
    [navigationBarAppearance setShadowImage:[theme topShadowImage]];
    [navigationBarAppearance setTitleTextAttributes:[theme navigationBarTitleAttributes]];
    
    UIBarButtonItem *barButtonItemAppearance = [UIBarButtonItem appearance];
    
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
    
    [barButtonItemAppearance setTitleTextAttributes:[theme barButtonTitleAttributesForState:UIControlStateNormal] forState:UIControlStateNormal];
    [barButtonItemAppearance setTitleTextAttributes:[theme barButtonTitleAttributesForState:UIControlStateSelected] forState:UIControlStateSelected];
    [barButtonItemAppearance setTitleTextAttributes:[theme barButtonTitleAttributesForState:UIControlStateDisabled] forState:UIControlStateDisabled];
    
    UITabBar *tabBarAppearance = [UITabBar appearance];
    
    [tabBarAppearance setBackgroundImage:[theme tabBarBackground]];
    [tabBarAppearance setSelectionIndicatorImage:[theme tabBarSelectionIndicator]];
    
    UITabBarItem *tabBarItemAppearance = [UITabBarItem appearance];
    
    [tabBarItemAppearance setTitleTextAttributes:[theme tabBarItemTextAttributesForState:UIControlStateNormal] forState:UIControlStateNormal];
    [tabBarItemAppearance setTitleTextAttributes:[theme tabBarItemTextAttributesForState:UIControlStateSelected] forState:UIControlStateSelected];
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
