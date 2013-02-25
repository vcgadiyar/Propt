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
extern NSString *pno;


extern int screen;
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
    screen = 1;
    //[self GetUser];
    
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

- (void)GetUser {
    Database *getUserFromDB = [[Database alloc]init];
    [getUserFromDB getUserMessage:pno];
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
    if (flag == 0) {
        
        cell.imageView.image = [UIImage imageNamed:@"nfl.jpg"];
    }
    else if (flag == 1)
    {
        cell.imageView.image = [UIImage imageNamed:@"smiley.jpg"];
    }
    /*if (flag == 1)
    {
        
    if([self.checkedIndexPath isEqual:indexPath])
    {
        NSMutableArray *pselected = [[NSMutableArray alloc] init];
        [pselected addObject:cell.textLabel.text];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    }*/
    return cell;
}

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Uncheck the previous checked row
    if(self.checkedIndexPath)
    {
        UITableViewCell* uncheckCell = [tableView
                                        cellForRowAtIndexPath:self.checkedIndexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
    }
    if([self.checkedIndexPath isEqual:indexPath])
    {
        self.checkedIndexPath = nil;
    }
    else
    {
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.checkedIndexPath = indexPath;
    }
    //[tableView reloadData];
}*/


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
        //[self GetGroups];
        //[array release];
        array = [[NSMutableArray alloc] init];
        CFErrorRef error = NULL;

        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
      
        
        
        if (addressBook != nil)
        {
            
            NSLog(@"Succesful.");
          
            NSArray *allContacts = (__bridge_transfer NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
          
            NSUInteger i = 0;
            for (i = 0; i < [allContacts count]; i++)
            {
                Person *person = [[Person alloc] init];
                ABRecordRef contactPerson = (__bridge ABRecordRef)allContacts[i];
                NSString *firstName = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonFirstNameProperty);
                NSString *lastName =  (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonLastNameProperty);
                NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
                person.firstName = firstName;
                person.lastName = lastName;
                person.fullName = fullName;
              
                ABMultiValueRef emails = ABRecordCopyValue(contactPerson, kABPersonEmailProperty);
               
                NSUInteger j = 0;
            
                for (j = 0; j < ABMultiValueGetCount(emails); j++)
                {
                   
                    NSString *email = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(emails, j);
                   
                    if (j == 0)
                    {
                     
                        person.homeEmail = email;
                       
                        NSLog(@"person.homeEmail = %@ ", person.homeEmail);
                       
                    }
                    else if (j==1)
                        person.workEmail = email;

                }
                [array addObject:fullName];
             //   [self.Populate addObject:person];
              
            }
          
          
            CFRelease(addressBook);
           
        }
        
        
        //self.Populate.delegate = self;
        //self.Populate.dataSource = self;
        [self.Populate reloadData];
        
    }

}
- (IBAction)createGroup:(id)sender {
    myVC = [[NewGroup alloc]initWithNibName:@"NewGroup" bundle:nil];
    [self presentViewController:myVC animated:YES completion:nil];
    
}

- (IBAction)goto1:(id)sender {
    //[self dismissModalViewControllerAnimated:YES];
    screen = 0;

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
