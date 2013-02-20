//
//  FirstViewController.m
//  Venkatesh-Groups
//
//  Created by Propt Development on 2/19/13.
//  Copyright (c) 2013 Renaldo. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController




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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchView:(id)sender {
    ViewController *switchview = [[ViewController alloc ]initWithNibName:@"ViewController" bundle:nil];
    
    [self presentViewController:switchview animated:YES completion:NULL];
}
@end
