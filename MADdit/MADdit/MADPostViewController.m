//
//  MADPostViewController.m
//  MADdit
//
//  Created by Eddie Saenz on 4/5/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import "MADPostViewController.h"

@interface MADPostViewController ()

@property (strong, nonatomic) UITextView* textView;
@property (strong, nonatomic) MADPost* post;

@end

@implementation MADPostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithMADPost:(MADPost *)post
{
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        self.post = post;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.text = self.post.text;
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
