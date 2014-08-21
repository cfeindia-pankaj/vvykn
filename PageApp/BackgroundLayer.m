//
//  BackgroundLayer.m
//  PageApp
//
//  Created by Pankaj Kumar Singh on 18/08/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer

+ (CAGradientLayer*) blueGradient {
    
    
    UIColor *colorOne = [UIColor colorWithRed:(18/255.0)  green:(130/255.0)  blue:(194/255.0)  alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(26/255.0)  green:(180/255.0)  blue:(218/255.0)  alpha:1.0];
    UIColor *colorThree = [UIColor colorWithRed:(15/255.0) green:(127/255.0) blue:(191/255.0) alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, colorThree.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    NSNumber *stopThree=[NSNumber numberWithFloat:2.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo,stopThree, nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    
    return headerLayer;
    
}


@end
