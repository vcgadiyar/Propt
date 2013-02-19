//
//  ViewController.m
//  Venkatesh-Groups
//
//  Created by Renaldo on 2/18/13.
//  Copyright (c) 2013 Renaldo. All rights reserved.
//

#import "ViewController.h"
#import "Database.h"

 
@interface ViewController (){
    
}

@end

@implementation ViewController

@synthesize array;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];

    
	// Do any additional setup after loading the view, typically from a nib.
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

- (void)GetGroups {
    Database *getFromDB = [[Database alloc]init];
    [getFromDB getMessage];
}


- (IBAction)onClick:(id)sender {
    
    [self GetGroups];
    
    
    //array = [[NSArray alloc]initWithObjects:@"Venka Bhosdi Wala", @"ABCD",@"EFGH", nil];
    self.Populate.delegate = self;
    self.Populate.dataSource = self;
    [self.Populate reloadData];
    

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

@end
