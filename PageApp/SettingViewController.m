//
//  SettingViewController.m
//  PageApp
//
//  Created by Pankaj Kumar Singh on 17/08/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "SettingViewController.h"
#import "RCSwitchOnOff.h"
#import "ADVTheme.h"
#import "RangeSlider.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Setting";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.603 blue:0.787 alpha:1];
    self.title=@"Setting";
    // Do any additional setup after loading the view from its nib.
    [ADVThemeManager customizeView:self.view];
    
    if ([[UISwitch appearance] respondsToSelector:@selector(onImage)]) {
        
    } else {
        RCSwitchOnOff* onSwitch = [[RCSwitchOnOff alloc] initWithFrame:CGRectMake(72, 20, 76, 40)];
        [onSwitch setOn:YES];
        [self.view addSubview:onSwitch];
        
        RCSwitchOnOff* offSwitch = [[RCSwitchOnOff alloc] initWithFrame:CGRectMake(176, 20, 76, 40)];
        [offSwitch setOn:NO];
        [self.view addSubview:offSwitch];
    }

    
    
    slider = [[RangeSlider alloc] initWithFrame:CGRectMake(10, 100, 300, 30)]; // the slider enforces a height of 30, although I'm not sure that this is necessary
	
	slider.minimumRangeLength = .03; // this property enforces a minimum range size. By default it is set to 0.0
	
	[slider setMinThumbImage:[UIImage imageNamed:@"rangethumb.png"]]; // the two thumb controls are given custom images
	[slider setMaxThumbImage:[UIImage imageNamed:@"rangethumb.png"]];
	
	
	UIImage *image; // there are two track images, one for the range "track", and one for the filled in region of the track between the slider thumbs
	
	[slider setTrackImage:[[UIImage imageNamed:@"fullrange.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(9.0, 9.0, 9.0, 9.0)]];
	
	image = [UIImage imageNamed:@"fillrange.png"];
	[slider setInRangeTrackImage:image];
    
	
	[slider addTarget:self action:@selector(report:) forControlEvents:UIControlEventValueChanged]; // The slider sends actions when the value of the minimum or maximum changes
	
	
	reportLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, 310, 30)]; // a label to see the values of the slider in this demo
	reportLabel.adjustsFontSizeToFitWidth = YES;
	reportLabel.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:reportLabel];
	NSString *report = [NSString stringWithFormat:@"current slider range is %f to %f", slider.min, slider.max];
	reportLabel.text = report;
	
    [self.view addSubview:slider];
   }
- (void)report:(RangeSlider *)sender {
	NSString *report = [NSString stringWithFormat:@"current slider range is %f to %f", sender.min, sender.max];
	reportLabel.text = report;
	NSLog(@"%@",report);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
