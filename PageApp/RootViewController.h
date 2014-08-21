//
//  RootViewController.h
//  PageApp
//
//  Created by Pankaj Kumar Singh on 17/08/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
@class APPViewController;
@interface RootViewController : UIViewController

{
    IBOutlet UITextField *user;
    IBOutlet UITextField *pass;
    IBOutlet UIImageView *uname;
    IBOutlet UIImageView *pword;
    IBOutlet UIButton *login;
    IBOutlet UIButton *signup;
    IBOutlet UIButton *facebook;
    IBOutlet UIButton *gmail;
    IBOutlet UIButton *linked;
    IBOutlet UIImageView *logo;
    IBOutlet UIButton *logob;

}



-(IBAction)onClick:(id)sender;
-(IBAction)onClickRegister:(id)sender;

@end
