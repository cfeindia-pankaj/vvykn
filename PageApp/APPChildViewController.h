//
//  APPChildViewController.h
//  PageApp
//
//  Created by Rafael Garcia Leiva on 10/06/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPChildViewController : UIViewController
{
    IBOutlet UIImageView *image1;
     IBOutlet UIImageView *image2;
     IBOutlet UIImageView *image3;
     IBOutlet UIImageView *image4;
     IBOutlet UIImageView *image5;
    IBOutlet UILabel *label;
    IBOutlet UILabel *suggection;
    //IBOutlet UILabel *head;
}
@property (assign, nonatomic) NSInteger index;


@end
