//
//  MADMainViewController.m
//  MADdit
//
//  Created by Eddie Saenz on 3/28/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import "MADMainViewController.h"
#import "MADPost.h"

@interface MADMainViewController ()

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) NSMutableArray *madditPosts;

@end

@implementation MADMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.madditPosts = [NSMutableArray array];
    }
    return self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // clear old posts
    [self.madditPosts removeAllObjects];
    
    // make request
    NSString *urlString = [NSString stringWithFormat:@"http://reddit.com/r/%@.json", textField.text];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (data == nil) {
        NSLog(@"%@", error);
    }
    
    // make json
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (jsonData == nil) {
        NSLog(@"%@", error);
    }
    
    //parse jsonData
    for (NSDictionary *d in [[jsonData objectForKey:@"data"] objectForKey:@"children"]) {
        [self.madditPosts addObject:[[MADPost alloc]initWithData:d]];
    }
    
//    for (MADPost *p in self.madditPosts) {
//        NSLog(@"%@", p.title);
//    }
    
    [self.table reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MadditCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MadditCell"];
    }
    MADPost *post = self.madditPosts[indexPath.row];
    cell.textLabel.text = post.title;
    cell.detailTextLabel.text = post.subReddit;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.madditPosts count];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, 320, CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 0, 300, 100)];
    self.textField.placeholder = @"Subreddit Search";
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
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
