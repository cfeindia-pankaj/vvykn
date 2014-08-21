//
//  ImageLayer.h
//  theme1
//
//  Created by CFE INDIA on 16/08/14.
//  Copyright (c) 2014 com.cfeindia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageLayer : CALayer
@property (nonatomic,assign )float percent;
@property (nonatomic, strong) NSString *imageName;
-(UIImage *) image:(UIImage *)image withMaskColor:(UIColor *)color;
@end
