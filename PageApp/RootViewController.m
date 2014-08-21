//
//  RootViewController.m
//  PageApp
//
//  Created by Pankaj Kumar Singh on 17/08/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "ProfileViewController.h"
#import "AboutUsViewController.h"
#import "SettingViewController.h"
#import "ADVTheme.h"
#import "APPViewController.h"
#import "BackgroundLayer.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    // Custom initialization
       
        self.title=@"Login";
    }
    return self;
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
-(IBAction)onClick:(id)sender
{
    UINavigationController *home=[[UINavigationController alloc]initWithRootViewController:[[HomeViewController alloc]init]];
    UINavigationController *profile=[[UINavigationController alloc]initWithRootViewController:[[ProfileViewController alloc]init]];
    UINavigationController *aboutus=[[UINavigationController alloc]initWithRootViewController:[[AboutUsViewController alloc]init]];
    UINavigationController *setting=[[UINavigationController alloc] initWithRootViewController:[[SettingViewController alloc]init]];
   // UINavigationController *alert=[[UINavigationController alloc] initWithRootViewController:[[AlertViewController alloc]init]];

    
    UITabBarController *tabBar=[[UITabBarController alloc]init];
    tabBar.viewControllers=@[home,profile,setting,aboutus];
    
//    UINavigationController * nav=[[UINavigationController alloc]init];
//    [nav.]
    [self presentModalViewController:tabBar animated:true];
   
     
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor blackColor] } forState:UIControlStateSelected];
    
    
    NSArray *items = tabBar.tabBar.items;
    for (int idx = 0; idx < items.count; idx++) {
        UITabBarItem *item = [items objectAtIndex:idx];
        [ADVThemeManager customizeTabBarItem:item forTab:((SSThemeTab)idx)];
    }

    
    

}

-(IBAction)onClickRegister:(id)sender
{
    APPViewController *viewController;
    
viewController = [[APPViewController alloc] initWithNibName:@"APPViewController" bundle:nil];
   [self presentModalViewController:viewController animated:true];
   

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    uname.image=[UIImage imageNamed:@"ic_username"];
    pword.image=[UIImage imageNamed:@"ic_password"];
    
    
    CAGradientLayer *bgLayer = [BackgroundLayer blueGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    
 //self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.603 blue:0.787 alpha:1];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
