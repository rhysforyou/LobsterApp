//
//  LAReddishTheme.m
//  LobsterApp
//
//  Created by Rhys Powell on 19/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "LAReddishTheme.h"

@implementation LAReddishTheme

- (UIColor *)mainColor
{
    return [UIColor colorWithRed:151.0/255.0 green:25.0/255.0 blue:30.0/255.0 alpha:1.0];
}

- (UIColor *)baseTintColor
{
    return [self mainColor];
}

- (UIImage *)navigationBackgroundForBarMetrics:(UIBarMetrics)barMetrics
{
    NSString *imageName = @"navigationBackground";
    
    if (barMetrics == UIBarMetricsLandscapePhone) {
        imageName = [imageName stringByAppendingString:@"Landscape"];
    }
    
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(5.0, 5.0, 0.0, 5.0)];
    
    return image;
}

- (UIImage *)topShadowImage
{
    return [UIImage imageNamed:@"topShadow"];
}

- (NSDictionary *)navigationBarTitleAttributes
{
    NSDictionary *attributes = @{
        UITextAttributeFont : [UIFont fontWithName:@"Helvetica-Light" size:20.0]
    };
    
    return attributes;
}

- (UIImage *)tabBarBackground
{
    return [UIImage imageNamed:@"tabBarBackground"];
}

- (UIImage *)tabBarSelectionIndicator
{
    UIImage *image = [UIImage imageNamed:@"tabBarSelectionIndicator"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5.0, 0.0, 5.0)];
    
    return image;
}

- (NSDictionary *)tabBarItemTextAttributesForState:(UIControlState)state
{
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    attributes[UITextAttributeFont] = [UIFont fontWithName:@"Helvetica-Light" size:11.0];
    
    if (state == UIControlStateSelected) {
        attributes[UITextAttributeTextColor] = [UIColor whiteColor];
    } else {
        attributes[UITextAttributeTextColor] = [UIColor colorWithWhite:1.0 alpha:0.5];
    }
    
    return attributes;
}

@end
