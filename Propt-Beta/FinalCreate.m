//
//  FinalCreate.m
//  Propt-Beta
//
//  Created by Propt Development on 2/24/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import "FinalCreate.h"
//#import "AppDelegate.h"

@interface FinalCreate ()

@end

@implementation FinalCreate

//extern NSMutableArray *sname;
extern NSString *groupName;
@synthesize gname;
//@synthesize names;

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
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    gname.text = groupName;
    name1 =appDelegate.sname;
    
    self.Populate.delegate = self;
    self.Populate.dataSource = self;
    // Do any additional setup after loading the view from its nib.
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
    return name1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text = [name1 objectAtIndex:indexPath.row];
    return cell;
}

@end
