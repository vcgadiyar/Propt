//
//  FinalCreate.m
//  Propt-Beta
//
//  Created by Propt Development on 2/24/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//
//-(void) createGroup:(NSString *)gname

#import "FinalCreate.h"
//#import "AppDelegate.h"
#import "Database.h"

@interface FinalCreate ()

@end
NSInteger i;
@implementation FinalCreate

//extern NSMutableArray *sname;
extern NSString *groupName;
extern NSString *userID;
extern NSString *pno;
extern int m1;
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
    i=0;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"Notification1"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"Notification2"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"Notification3"
                                               object:nil];


        
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    gname.text = groupName;
    name1 =appDelegate.sname;
    
    self.Populate.delegate = self;
    self.Populate.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"Notification1"])
         [self GroupNew];
    else if ([[notification name] isEqualToString:@"Notification2"])
    {
        
    NSString *str;
    if (i < [appDelegate.selectedNumbers count])
    {
        
        str = [appDelegate.selectedNumbers objectAtIndex:i];
        str = [self removeUnwanted:str];
        i++;
        [self addGroup:str];
        //i++;
       
    }
    }
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

- (void)GroupNew
{
    Database * sendToDB = [[Database alloc] init];
    
    //NSString *myString = number.text;
    [sendToDB createGroup:groupName];
    
    
    
}

- (IBAction)create_group:(id)sender {
    
    [self GetUser];
    
    
}

- (void)GetUser {
    Database *getUserFromDB = [[Database alloc]init];
    [getUserFromDB getUserMessage:pno];
}


- (void)addGroup: (NSString *)str
{
    Database * sendToDB = [[Database alloc] init];
    NSString *uid = userID;
    //uid = [self removeUnwanted:uid];
    [sendToDB addToGroup:groupName userID:userID phoneNo:str];
}

- (NSString *)removeUnwanted:(NSString *)input
{
    NSString *s;
    //input = [[NSString alloc] init];
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"() "];
    s = [[input componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
    NSLog(@"%@", s);
    return s;
}
@end
