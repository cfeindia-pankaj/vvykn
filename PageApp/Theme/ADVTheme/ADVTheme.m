//
//  ADVTheme.m
//  
//
//  Created by Valentin Filip on 7/9/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "ADVTheme.h"

#import "ADVDefaultTheme.h"
#import "ADVFitpulseTheme.h"

@implementation ADVThemeManager

+ (id <ADVTheme>)sharedTheme
{
    static id <ADVTheme> sharedTheme = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Create and return the theme:
//        sharedTheme = [[ADVDefaultTheme alloc] init];
        sharedTheme = [[ADVFitpulseTheme alloc] init];
    });
    
    return sharedTheme;
}

+ (void)customizeAppAppearance
{
    id <ADVTheme> theme = [self sharedTheme];
    UIStatusBarStyle statusBarStyle = [theme statusBarStyle];
    if (statusBarStyle) {
        [[UIApplication sharedApplication]
         setStatusBarStyle:statusBarStyle animated:NO];
    }
    
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setBackgroundImage:[theme navigationBackgroundForBarMetrics:UIBarMetricsDefault] forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setBackgroundImage:[theme navigationBackgroundForBarMetrics:UIBarMetricsLandscapePhone] forBarMetrics:UIBarMetricsLandscapePhone];
   
    UIBarButtonItem *barButtonItemAppearance = [UIBarButtonItem appearance];
            
    [barButtonItemAppearance setBackgroundImage:[theme barButtonBackgroundForState:UIControlStateNormal style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
    [barButtonItemAppearance setBackButtonBackgroundImage:[theme backBackgroundForState:UIControlStateNormal barMetrics:UIBarMetricsDefault] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [barButtonItemAppearance setBackButtonBackgroundImage:[theme backBackgroundForState:UIControlStateSelected barMetrics:UIBarMetricsDefault] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [barButtonItemAppearance setBackButtonBackgroundImage:[theme backBackgroundForState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone] forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    [barButtonItemAppearance setBackButtonBackgroundImage:[theme backBackgroundForState:UIControlStateSelected barMetrics:UIBarMetricsLandscapePhone] forState:UIControlStateSelected barMetrics:UIBarMetricsLandscapePhone];
    
    UISegmentedControl *segmentedAppearance = [UISegmentedControl appearance];
    [segmentedAppearance setBackgroundImage:[theme segmentedBackgroundForState:UIControlStateNormal barMetrics:UIBarMetricsDefault] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segmentedAppearance setBackgroundImage:[theme segmentedBackgroundForState:UIControlStateSelected barMetrics:UIBarMetricsDefault] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [segmentedAppearance setBackgroundImage:[theme segmentedBackgroundForState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone] forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    [segmentedAppearance setBackgroundImage:[theme segmentedBackgroundForState:UIControlStateSelected barMetrics:UIBarMetricsLandscapePhone] forState:UIControlStateSelected barMetrics:UIBarMetricsLandscapePhone];
    
    [segmentedAppearance setDividerImage:[theme segmentedDividerForBarMetrics:UIBarMetricsDefault] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segmentedAppearance setDividerImage:[theme segmentedDividerForBarMetrics:UIBarMetricsLandscapePhone] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setBackgroundImage:[theme tabBarBackground]];
    [tabBarAppearance setSelectionIndicatorImage:[theme tabBarSelectionIndicator]];
    
    
    UIToolbar *toolbarAppearance = [UIToolbar appearance];
    [toolbarAppearance setBackgroundImage:[theme toolbarBackgroundForBarMetrics:UIBarMetricsDefault] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [toolbarAppearance setBackgroundImage:[theme toolbarBackgroundForBarMetrics:UIBarMetricsLandscapePhone] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsLandscapePhone];
    
    UISearchBar *searchBarAppearance = [UISearchBar appearance];
    [searchBarAppearance setBackgroundImage:[theme searchBackground]];
    [searchBarAppearance setSearchFieldBackgroundImage:[theme searchFieldImage] forState:UIControlStateNormal];
    [searchBarAppearance setImage:[theme searchImageForIcon:UISearchBarIconSearch state:UIControlStateNormal] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    [searchBarAppearance setImage:[theme searchImageForIcon:UISearchBarIconClear state:UIControlStateNormal] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
    [searchBarAppearance setImage:[theme searchImageForIcon:UISearchBarIconClear state:UIControlStateSelected] forSearchBarIcon:UISearchBarIconClear state:UIControlStateSelected];
    [searchBarAppearance setScopeBarBackgroundImage:[theme searchBackground]];
    [searchBarAppearance setScopeBarButtonBackgroundImage:[theme searchScopeButtonBackgroundForState:UIControlStateNormal] forState:UIControlStateNormal];
    [searchBarAppearance setScopeBarButtonBackgroundImage:[theme searchScopeButtonBackgroundForState:UIControlStateSelected] forState:UIControlStateSelected];
    [searchBarAppearance setScopeBarButtonDividerImage:[theme searchScopeButtonDivider] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal];
    
    UISlider *sliderAppearance = [UISlider appearance];
    [sliderAppearance setThumbImage:[theme sliderThumbForState:UIControlStateNormal] forState:UIControlStateNormal];
    [sliderAppearance setThumbImage:[theme sliderThumbForState:UIControlStateSelected] forState:UIControlStateSelected];
    [sliderAppearance setMinimumTrackImage:[theme sliderMinTrack] forState:UIControlStateNormal];
    [sliderAppearance setMaximumTrackImage:[theme sliderMaxTrack] forState:UIControlStateNormal];
    
    UIProgressView *progressAppearance = [UIProgressView appearance];
    [progressAppearance setTrackImage:[theme progressTrackImage]];

    
    UISwitch *switchAppearance = [UISwitch appearance];
    [switchAppearance setOnTintColor:[theme switchOnColor]];

        
    NSMutableDictionary *titleTextAttributesNav = [[NSMutableDictionary alloc] init];
    UIColor *navTextColor = [theme navigationTextColor];
    if (navTextColor) {
        titleTextAttributesNav[NSForegroundColorAttributeName] = navTextColor;
    }
    
    UIColor *navTextShadowColor = [theme navigationTextShadowColor];
    if (navTextShadowColor) {
        CGSize shadowOffset = [theme shadowOffset];
        NSShadow* shadow = [NSShadow new];
        shadow.shadowOffset = shadowOffset;
        shadow.shadowColor = navTextShadowColor;
        titleTextAttributesNav[NSShadowAttributeName] = shadow;
    }
    UIFont *navTextFont = [theme navigationFont];
    if (navTextFont) {
        titleTextAttributesNav[NSFontAttributeName] = navTextFont;
    }
    
    [navigationBarAppearance setTitleTextAttributes:titleTextAttributesNav];
    
    [barButtonItemAppearance setTitleTextAttributes:titleTextAttributesNav forState:UIControlStateNormal];
    [searchBarAppearance setScopeBarButtonTitleTextAttributes:titleTextAttributesNav forState:UIControlStateNormal];
    
    NSMutableDictionary *titleTextAttributes = [[NSMutableDictionary alloc] init];
    UIColor *mainColor = [theme mainColor];
    if (mainColor) {
        titleTextAttributes[NSForegroundColorAttributeName] = mainColor;
    }
    
    UIColor *shadowColor = [theme shadowColor];
    if (shadowColor) {
        
        CGSize shadowOffset = [theme shadowOffset];
        NSShadow* shadow = [NSShadow new];
        shadow.shadowOffset = shadowOffset;
        shadow.shadowColor = shadowColor;
        titleTextAttributesNav[NSShadowAttributeName] = shadow;
    }
    [segmentedAppearance setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    
    NSMutableDictionary *titleTextAttributesH = [[NSMutableDictionary alloc] init];
    UIColor *highlightShadowColor = [theme highlightShadowColor];
    if (highlightShadowColor) {
        
        CGSize shadowOffset = [theme shadowOffset];
        NSShadow* shadow = [NSShadow new];
        shadow.shadowOffset = shadowOffset;
        shadow.shadowColor = highlightShadowColor;
        titleTextAttributesNav[NSShadowAttributeName] = shadow;
    }

    UIColor *highlightColor = [theme highlightColor];
    if (highlightColor) {
        
        CGSize shadowOffset = [theme shadowOffset];
        NSShadow* shadow = [NSShadow new];
        shadow.shadowOffset = shadowOffset;
        titleTextAttributesNav[NSShadowAttributeName] = shadow;
        
        titleTextAttributesH[NSForegroundColorAttributeName] = highlightColor;
    }    
    [barButtonItemAppearance setTitleTextAttributes:titleTextAttributesH forState:UIControlStateSelected];
    [segmentedAppearance setTitleTextAttributes:titleTextAttributesH forState:UIControlStateSelected];
    [searchBarAppearance setScopeBarButtonTitleTextAttributes:titleTextAttributesH forState:UIControlStateSelected];
    
//    UILabel *headerLabelAppearance = [UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil];
//    UIColor *accentTintColor = [theme accentTintColor];
//    if (accentTintColor) {
//        [sliderAppearance setMaximumTrackTintColor:accentTintColor];
//        [progressAppearance setTrackTintColor:accentTintColor];
//        UIBarButtonItem *toolbarBarButtonItemAppearance = [UIBarButtonItem appearanceWhenContainedIn:[UIToolbar class], nil];
//        [toolbarBarButtonItemAppearance setTintColor:accentTintColor];
//    }
    
    UIColor *selectedTabbarItemTintColor = [theme selectedTabbarItemTintColor];
    if (selectedTabbarItemTintColor) {
        [tabBarAppearance setSelectedImageTintColor:selectedTabbarItemTintColor];
    }
    
    UIColor *baseTintColor = [theme baseTintColor];
    if (baseTintColor) {
        [navigationBarAppearance setTintColor:baseTintColor];
        [barButtonItemAppearance setTintColor:baseTintColor];
        [segmentedAppearance setTintColor:baseTintColor];
        [tabBarAppearance setTintColor:baseTintColor];
        [toolbarAppearance setTintColor:baseTintColor];
        [searchBarAppearance setTintColor:baseTintColor];
        [sliderAppearance setThumbTintColor:baseTintColor];
        [sliderAppearance setMinimumTrackTintColor:baseTintColor];
        [progressAppearance setProgressTintColor:baseTintColor];
        //[stepperAppearance setTintColor:baseTintColor];

    } else if (mainColor) {

    }
}

+ (void)customizeView:(UIView *)view
{
    id <ADVTheme> theme = [self sharedTheme];
    UIImage *backgroundImage = [theme viewBackground];
    UIColor *backgroundColor = [theme backgroundColor];
    if (backgroundImage) {
        [view setBackgroundColor:[UIColor colorWithPatternImage:backgroundImage]];
    } else if (backgroundColor) {
        [view setBackgroundColor:backgroundColor];
    }
}

+ (void)customizeTableView:(UITableView *)tableView
{
    id <ADVTheme> theme = [self sharedTheme];
    UIImage *backgroundImage = [theme tableBackground];
    UIColor *backgroundColor = [theme backgroundColor];
    if (backgroundImage) {
        UIImageView *background = [[UIImageView alloc] initWithImage:backgroundImage];
        [tableView setBackgroundView:background];
    } else if (backgroundColor) {
        [tableView setBackgroundView:nil];
        [tableView setBackgroundColor:backgroundColor];
    }
}

+ (void)customizeTabBarItem:(UITabBarItem *)item forTab:(SSThemeTab)tab
{
    id <ADVTheme> theme = [self sharedTheme];
    UIImage *image = [theme imageForTab:tab];
    if (image) {
        // If we have a regular image, set that
        [item setImage:image];
    } else {
        // Otherwise, set the finished images
        UIImage *selectedImage = [theme finishedImageForTab:tab selected:YES];
        UIImage *unselectedImage = [theme finishedImageForTab:tab selected:NO];
        
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        unselectedImage = [unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        item = [item initWithTitle:item.title image:unselectedImage selectedImage:selectedImage];
    }
}

+ (void)customizeMainLabel:(UILabel *)label {
    label.textColor = [[ADVThemeManager sharedTheme] mainColor];
    label.shadowColor = [UIColor whiteColor];
    label.shadowOffset = CGSizeMake(0, 1);
}

+ (void)customizeSecondaryLabel:(UILabel *)label {
    label.textColor = [[ADVThemeManager sharedTheme] secondColor];
    label.shadowColor = [UIColor whiteColor];
    label.shadowOffset = CGSizeMake(0, 1);
}

@end
