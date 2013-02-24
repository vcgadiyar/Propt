//
//  Contacts.m
//  Propt-Beta
//
//  Created by Propt Development on 2/22/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import "Contacts.h"
#import "AddressBook/AddressBook.h"
#import "Person.h"

@interface Contacts ()

@end

@implementation Contacts

@synthesize newarray;
@synthesize searchBar;
@synthesize allTableData;
@synthesize filteredTableData;
extern int screen;


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
    
    screen = 4;
    isFiltered = FALSE;
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    searchBar.delegate = self;
    for (UIView *searchBarSubview in [searchBar subviews]) {
        
        if ([searchBarSubview conformsToProtocol:@protocol(UITextInputTraits)]) {
            
            @try {
                
                [(UITextField *)searchBarSubview setReturnKeyType:UIReturnKeyDone];
                [(UITextField *)searchBarSubview setKeyboardAppearance:UIKeyboardAppearanceAlert];
            }
            @catch (NSException * e) {
                
                // ignore exception
            }
        }
    }
    
    self.Populate.tableHeaderView = searchBar;
    self.Populate.delegate = self;
    self.Populate.dataSource = self;
    newarray = [[NSMutableArray alloc] init];
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
            NSString *pNo =  (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonPhoneProperty);
            
            NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
            person.firstName = firstName;
            person.lastName = lastName;
            person.fullName = fullName;
            person.phoneNo = pNo;
            
            
            
            [newarray addObject:person.fullName];
            //   [self.Populate addObject:person];
            
        }
        
        
        CFRelease(addressBook);
        
    }
    allTableData = newarray;

    
    // Do any additional setup after loading the view from its nib.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    allTableData = newarray;

        if(text.length == 0)
    {
        isFiltered = FALSE;
    }
    else
    {
        isFiltered = true;
        filteredTableData = [[NSMutableArray alloc] init];
        
        for (NSString * food in allTableData)
        {
            NSRange nameRange = [food rangeOfString:text options:NSCaseInsensitiveSearch];
            NSRange descriptionRange = [food.description rangeOfString:text options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound || descriptionRange.location != NSNotFound)
            {
                [filteredTableData addObject:food];
            }
        }
    }
    
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
    //return newarray.count;
    int rowCount;
    if(self->isFiltered)
        rowCount = filteredTableData.count;
    else
        rowCount = allTableData.count;
    
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
     if(isFiltered)
    cell.textLabel.text = [filteredTableData objectAtIndex:indexPath.row];
    else
       cell.textLabel.text = [allTableData objectAtIndex:indexPath.row];
      
        cell.imageView.image = [UIImage imageNamed:@"smiley.jpg"];
   
           
        if([self->checkedIndexPath isEqual:indexPath])
        {
            NSMutableArray *pselected = [[NSMutableArray alloc] init];
            [pselected addObject:cell.textLabel.text];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Uncheck the previous checked row
    if(self->checkedIndexPath)
    {
        UITableViewCell* uncheckCell = [tableView
                                        cellForRowAtIndexPath:self->checkedIndexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
    }
    if([self->checkedIndexPath isEqual:indexPath])
    {
        self->checkedIndexPath = nil;
    }
    else
    {
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self->checkedIndexPath = indexPath;
    }
    //[tableView reloadData];
}
/*


- (IBAction)switchBack:(id)sender {
    
     [self dismissModalViewControllerAnimated:YES];
}*/
- (IBAction)switchBack:(Contacts *)ctr {
    //[self dismissViewControllerAnimated:YES completion:nil];
    [ctr.navigationController popViewControllerAnimated:YES];
}
@end
