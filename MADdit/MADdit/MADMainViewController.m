//
//  MADMainViewController.m
//  MADdit
//
//  Created by Eddie Saenz on 3/28/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import "MADMainViewController.h"

@interface MADMainViewController ()

@property (strong, nonatomic) UITableView* table;
@property (strong, nonatomic) UITextField* textField;

@end

@implementation MADMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 320, CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
        [self.view addSubview:self.table];
        
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, 300, 100)];
        self.textField.placeholder = @"Subreddit Search";
        [self.view addSubview:self.textField];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
