//
//  ProfileViewController.m
//  PageApp
//
//  Created by Pankaj Kumar Singh on 17/08/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "ProfileViewController.h"
#import "ADVTheme.h"
#import "UIImage+iPhone5.h"
#import "Utils.h"

#import <QuartzCore/QuartzCore.h>

@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize lblKg;
@synthesize lblKgDesc;
@synthesize lblKgStartDesc;
@synthesize lblKgStart;
@synthesize lblKgCurrDesc;
@synthesize lblKgCurr;
@synthesize btnWorkouts;
@synthesize btnCardio;
@synthesize btnJournal;
@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Profile";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     [ADVThemeManager customizeView:self.view];
    
    if(![Utils isVersion6AndBelow])
        self.navigationController.navigationBar.translucent = NO;
	
    [ADVThemeManager customizeTableView:self.tableView];
    
    self.items = @[@{@"title": @"Nutrition"
                     , @"icon": @"list-item-nutrition"}
                   , @{@"title": @"Workout"
                       , @"icon": @"list-item-workout"}
                   , @{@"title": @"Weight"
                       , @"icon": @"list-item-weight"}];
    
    [ADVThemeManager customizeMainLabel:self.lblKg];
    self.lblKg.font = [UIFont fontWithName:@"DINPro-Bold" size:40.0f];
    self.lblKg.textColor = [UIColor colorWithRed:0.29f green:0.29f blue:0.29f alpha:1.00f];
    [ADVThemeManager customizeSecondaryLabel:self.lblKgDesc];
    self.lblKgDesc.font = [UIFont fontWithName:@"DINPro-CondBold" size:20.0f];
    self.lblKgDesc.textColor = [UIColor colorWithRed:0.53f green:0.53f blue:0.53f alpha:1.00f];
    
    [ADVThemeManager customizeMainLabel:self.lblKgStart];
    self.lblKgStart.font = [UIFont fontWithName:@"DINPro-CondBold" size:14.0f];
    self.lblKgStart.textColor = [UIColor colorWithRed:0.29f green:0.29f blue:0.29f alpha:1.00f];
    [ADVThemeManager customizeSecondaryLabel:self.lblKgStartDesc];
    self.lblKgStartDesc.font = [UIFont fontWithName:@"DINPro-CondBold" size:14.0f];
    self.lblKgStartDesc.textColor = [UIColor colorWithRed:0.53f green:0.53f blue:0.53f alpha:1.00f];
    
    [ADVThemeManager customizeMainLabel:self.lblKgCurr];
    self.lblKgCurr.font = [UIFont fontWithName:@"DINPro-CondBold" size:14.0f];
    self.lblKgCurr.textColor = [UIColor colorWithRed:0.29f green:0.29f blue:0.29f alpha:1.00f];
    [ADVThemeManager customizeSecondaryLabel:self.lblKgCurrDesc];
    self.lblKgCurrDesc.font = [UIFont fontWithName:@"DINPro-CondBold" size:14.0f];
    self.lblKgCurrDesc.textColor = [UIColor colorWithRed:0.53f green:0.53f blue:0.53f alpha:1.00f];
    
    UIImageView *imgTableFooter = [[UIImageView alloc] initWithImage:[[ADVThemeManager sharedTheme] tableFooterBackground]];
    [self.tableView setTableFooterView:imgTableFooter];
   [self.tableView reloadData];
    
    
    [self.profileImage setImage:[UIImage imageNamed:@"profile.jpg"]];
    
    // make new layer to contain shadow and masked image
    CALayer* containerLayer = [CALayer layer];
    containerLayer.shadowColor = [UIColor blackColor].CGColor;
    containerLayer.shadowRadius = 3.0f;
    containerLayer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    containerLayer.shadowOpacity = 0.3f;
    
    // use the image's layer to mask the image into a circle
    self.profileImage.layer.cornerRadius = roundf(self.profileImage.frame.size.width/2.0);
    self.profileImage.layer.masksToBounds = YES;
    self.profileImage.layer.borderColor = [UIColor whiteColor].CGColor;
    self.profileImage.layer.borderWidth = 3.0;
    
    // add masked image layer into container layer so that it's shadowed
    [containerLayer addSublayer:self.profileImage.layer];
    
    // add container including masked image and shadow into view
    [self.view.layer addSublayer:containerLayer];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


    
    
    



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIImageView *imgBkg = [[UIImageView alloc] initWithImage:[[ADVThemeManager sharedTheme] tableSectionHeaderBackground1]];
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(92, 0, 300, 22)];
   
    lblTitle.backgroundColor = [UIColor clearColor];
   // lblTitle.textColor = [UIColor colorWithRed:18/255.0f green:130/255.0f blue:194/255.0f alpha:1.00f];
    lblTitle.textColor = [UIColor whiteColor];
    lblTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15.0f];
    
  
    if(section==0){
         lblTitle.text = @"Manage Account";
          [imgBkg addSubview:lblTitle];
        

    }
    if(section==1){
         lblTitle.text = @"Manage Subscription";
          [imgBkg addSubview:lblTitle];
       

    }
    return imgBkg;
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [aTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)atableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [atableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage tallImageNamed:@"list-element.png"]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}
@end
