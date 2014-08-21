//
//  SecondViewController.m
//  PageApp
//
//  Created by Pankaj Kumar Singh on 16/08/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "SecondViewController.h"
#import "TBCircularSlider.h"
#import "BackgroundLayer.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CAGradientLayer *bgLayer = [BackgroundLayer blueGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    
    
    image1.image = [UIImage imageNamed:@"ic_no_focus"];
    image2.image = [UIImage imageNamed:@"ic_no_focus"];
    image3.image = [UIImage imageNamed:@"ic_no_focus"];
    image4.image = [UIImage imageNamed:@"ic_no_focus"];
    image5.image = [UIImage imageNamed:@"ic_no_focus"];
    
    
    UIImage *redButtonImage = [UIImage imageNamed:@"ic_left"];
    
    UIButton *redButton = [UIButton buttonWithType:UIButtonTypeCustom];
    redButton.frame = CGRectMake(10.0, 335.0, 29.0, 29.0);
    [redButton setBackgroundImage:redButtonImage forState:UIControlStateNormal];
    
    [self.view addSubview:redButton];
    
    UIImage *redButtonImage1 = [UIImage imageNamed:@"ic_right"];
    
    UIButton *redButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    redButton1.frame = CGRectMake(280.0, 335.0, 29.0, 29.0);
    [redButton1 setBackgroundImage:redButtonImage1 forState:UIControlStateNormal];
    
    [self.view addSubview:redButton1];
    
    

    TBCircularSlider *slider = [[TBCircularSlider alloc]initWithFrame:CGRectMake(0, 60, TB_SLIDER_SIZE, TB_SLIDER_SIZE)];
    
    [slider addTarget:self action:@selector(newValue:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
}

-(void)newValue:(TBCircularSlider*)slider{
    //TBCircularSlider *slider = (TBCircularSlider*)sender;
    NSLog(@"Slider Value %d",slider.angle);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
