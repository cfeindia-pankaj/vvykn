//
//  FourthViewController.h
//  PageApp
//
//  Created by Pankaj Kumar Singh on 16/08/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourthViewController : UIViewController

{
    IBOutlet UIImageView *image1;
    IBOutlet UIImageView *image2;
    IBOutlet UIImageView *image3;
    IBOutlet UIImageView *image4;
    IBOutlet UIImageView *image5;
    IBOutlet UILabel *label;
    IBOutlet UILabel *header;
}

@property (assign, nonatomic) NSInteger index;

@end
