//
//  GroupsGames.m
//  Propt-Beta
//
//  Created by Propt Development on 2/21/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import "GroupsGames.h"
#include "Database.h"
#include "NewGroup.h"
#import "ViewController.h"

@interface GroupsGames ()

@end

@implementation GroupsGames

extern NSString *pname;



extern int flag;

@synthesize gName;
@synthesize array;
@synthesize FGbar;
@synthesize myVC;

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
    self.navigationItem.hidesBackButton = NO;
    NSString *abc = [NSString stringWithFormat:@"Welcome %@",pname];
    [[UINavigationBar appearance] setTintColor:[UIColor blueColor]];
    [[UIToolbar appearance] setTintColor:[UIColor blueColor]];
    gName.topItem.title = abc;
    flag = 0;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];

    // Do any additional setup after loading the view from its nib.
    [self GetGroups];
    //array = [[NSArray alloc]initWithObjects:@"Venka Bhosdi Wala", @"ABCD",@"EFGH", nil];
    
    self.Populate.delegate = self;
    self.Populate.dataSource = self;
    [self.Populate reloadData];
}

- (void)GetGroups {
    Database *getFromDB = [[Database alloc]init];
    [getFromDB getMessage];
}


- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"TestNotification"])
        array = [notification valueForKey:@"object"] ;
    [self.Populate reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;
}


- (IBAction)onAction: (id)sender
{
    if (FGbar.selectedSegmentIndex == 0)
    {
        flag = 0;
        [self GetGroups];
        self.Populate.delegate = self;
        self.Populate.dataSource = self;
        
        //array = [[NSArray alloc]initWithObjects:@"Venka Bhosdi Wala", @"ABCD",@"EFGH", nil];
        
        [self.Populate reloadData];
    }
    else if (FGbar.selectedSegmentIndex == 1) {
        flag = 1;
        [self GetGroups];
        
        
        //self.Populate.delegate = self;
        //self.Populate.dataSource = self;
        [self.Populate reloadData];
        
    }

}
- (IBAction)createGroup:(id)sender {
    myVC = [[NewGroup alloc]initWithNibName:@"NewGroup" bundle:nil];
    
    [self.view addSubview:myVC.view];
    
}

- (IBAction)goto1:(id)sender {
    //[self dismissModalViewControllerAnimated:YES];
}

@end
