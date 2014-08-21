//
//  ProfileViewController.h
//  PageApp
//
//  Created by Pankaj Kumar Singh on 17/08/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSArray *items;

@property (strong, nonatomic) IBOutlet UIImageView *profileImage;

@property (strong, nonatomic) IBOutlet UILabel *lblKg;
@property (strong, nonatomic) IBOutlet UILabel *lblKgDesc;
@property (strong, nonatomic) IBOutlet UILabel *lblKgStartDesc;
@property (strong, nonatomic) IBOutlet UILabel *lblKgStart;
@property (strong, nonatomic) IBOutlet UILabel *lblKgCurrDesc;
@property (strong, nonatomic) IBOutlet UILabel *lblKgCurr;

@property (strong, nonatomic) IBOutlet UIButton *btnWorkouts;
@property (strong, nonatomic) IBOutlet UIButton *btnCardio;
@property (strong, nonatomic) IBOutlet UIButton *btnJournal;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
