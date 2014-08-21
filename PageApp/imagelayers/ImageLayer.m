//
//  ImageLayer.m
//  theme1
//
//  Created by CFE INDIA on 16/08/14.
//  Copyright (c) 2014 com.cfeindia. All rights reserved.
//

#import "ImageLayer.h"

@interface ImageLayer ()

@end

@implementation ImageLayer

@dynamic percent;


+ (BOOL)needsDisplayForKey:(NSString *)key{
    if([key isEqualToString:@"percent"]){
        return YES;
    }else
        return [super needsDisplayForKey:key];
}


- (UIImage *) image:(UIImage *)image withMaskColor:(UIColor *)color
{
    //  UIImage *formattedImage = image ;
    
    UIGraphicsBeginImageContext(CGSizeMake(200, 200));
    [image drawInRect:CGRectMake(0, 0, 200, 200)];
    UIImage *formattedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    CGRect rect = {0, 0, formattedImage.size.width, formattedImage.size.height-100};
    CGRect rect1 = {0, formattedImage.size.height-100, formattedImage.size.width, formattedImage.size.height};
    UIGraphicsBeginImageContext(CGSizeMake(200, 200));
    
    [[UIColor blackColor ] setFill];
    UIRectFill(rect);
    
    
    [color setFill];
    UIRectFill(rect1);
    UIImage *tempColor = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    CGImageRef maskRef = [formattedImage CGImage];
    CGImageRef maskcg = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                          CGImageGetHeight(maskRef),
                                          CGImageGetBitsPerComponent(maskRef),
                                          CGImageGetBitsPerPixel(maskRef),
                                          CGImageGetBytesPerRow(maskRef),
                                          CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef maskedcg = CGImageCreateWithMask([tempColor CGImage], maskcg);
    //CGImageRelease(maskcg);
    UIImage *result = [UIImage imageWithCGImage:maskedcg];
    // CGImageRelease(maskedcg);
    
    return result;
}








/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
