//
//  HomeViewController.m
//  PageApp
//
//  Created by Pankaj Kumar Singh on 17/08/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "HomeViewController.h"
#import "ADVTheme.h"
#import "Utils.h"
#import "ImageLayer.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    self.title=@"Home";
        
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
    
    
    
    
    
    
    UIImageView *imgTableFooter = [[UIImageView alloc] initWithImage:[[ADVThemeManager sharedTheme] tableFooterBackground]];
    [self.tableView setTableFooterView:imgTableFooter];
    [self.tableView reloadData];

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//- (NSString *)tableView:(UITableView *)tableView //titleForHeaderInSection:(NSInteger)section {
    
    
    
    
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)atableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [atableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //cell = [self getCellContentView:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if(indexPath.row==0){
    UIImage *img = [UIImage imageNamed:@"Unknown-2"];
    
    UIImageView *viewToMask = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
        
        UIImage *img1 = [UIImage imageNamed:@"img_athlete"];
        
        UIImageView *viewToMask1 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 50, 100, 100)];
    
    ImageLayer *imglayer =[[ImageLayer alloc]init ];
    viewToMask.image =[imglayer image:img withMaskColor:[UIColor blueColor]];
        
        viewToMask1.image =[imglayer image:img1 withMaskColor:[UIColor redColor]];
        
    
    
    [cell addSubview:viewToMask];
        [cell addSubview:viewToMask1];
    }
    
    
    return cell;
}


- (UITableViewCell *)getCellContentView:(NSString *)cellIdentifier1
{
    //UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier] ];
    //UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 dequeueReusableCellWithIdentifier:cellIdentifier] ];
    
   UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:
                            UITableViewCellStyleDefault reuseIdentifier:cellIdentifier1];
    cell.backgroundColor=[UIColor clearColor];
    
    CGRect lbl1Rect = CGRectMake(20, 5, 280, 30);
    CGRect lbl2Rect = CGRectMake(20, 35, 280, 30);
    CGRect lbl3Rect = CGRectMake(20, 70, 280, 30);
    
    
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:lbl1Rect];
    lbl1.tag=1;
    lbl1.font=[UIFont fontWithName:@"Helvetica" size:13];
    lbl1.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:lbl1];
    
    
    UILabel *lbl2 = [[UILabel alloc] initWithFrame:lbl2Rect];
    lbl2.tag=1;
    lbl2.font=[UIFont fontWithName:@"Helvetica" size:13];
    lbl2.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:lbl2];
    
    
    UILabel *lbl3 = [[UILabel alloc] initWithFrame:lbl3Rect];
    lbl3.tag=1;
    lbl3.font=[UIFont fontWithName:@"Helvetica" size:13];
    lbl3.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:lbl3];
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
