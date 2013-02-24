//
//  NewGroup.m
//  Propt-Beta
//
//  Created by Propt Development on 2/21/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import "NewGroup.h"


@interface NewGroup ()


@end
NSString *fname;
NSString *pNumber;
@implementation NewGroup
int screen;


@synthesize myTextfield;

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
    screen = 3;
    [super viewDidLoad];
    self.myTextfield.delegate = self;
    [[UINavigationBar appearance] setTintColor:[UIColor blueColor]];
    /*[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    self->offset = self.view.center;*/
    // Do any additional setup after loading the view from its nib.
}

- (void)keyboardDidShow:(NSNotification *)note
{
    self.view.center = self->offset;
    /* move your views here */
}

- (void)keyboardDidHide:(NSNotification *)note
{
    self.view.center = self->offset;
    /* move your views here */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
- (IBAction)showPicker:(id)sender {
    myVC = [[Contacts alloc]initWithNibName:@"Contacts" bundle:nil];
    
    [self.view addSubview:myVC.view];
    
    
    
}/*
    ABPeoplePickerNavigationController *picker =
    [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    [self presentModalViewController:picker animated:YES];
}

- (IBAction)backto2:(id)sender {
}


- (void)peoplePickerNavigationControllerDidCancel: (ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    
    [self displayPerson:person];
    //[self dismissModalViewControllerAnimated:YES];
    
    return YES;
}
- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}

- (void)displayPerson:(ABRecordRef)person
{
    NSString* name = (__bridge_transfer NSString*)ABRecordCopyValue(person,
                                                                    kABPersonFirstNameProperty);
    fname = name;
    
    NSString* phone = nil;
    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person,
                                                     kABPersonPhoneProperty);
    if (ABMultiValueGetCount(phoneNumbers) > 0) {
        phone = (__bridge_transfer NSString*)
        ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
    } else {
        phone = @"[None]";
    }
    pNumber = phone;
    CFRelease(phoneNumbers);
}

/*- (void)numberOfRowsSelected:(NSInteger)numberRows withData:(NSArray *)data andDataType:(DATA_CONTACT)type
{
    if (type == DATA_CONTACT_TELEPHONE)
    {
        for (int i = 0; i < [data count]; i++)
        {
            NSString *str = [data objectAtIndex:i];
            
            str = [str reformatTelephone];
            
            NSLog(@"Telephone: %@", str);
        }
    }
    else if (type == DATA_CONTACT_EMAIL)
    {
        for (int i = 0; i < [data count]; i++)
        {
            NSString *str = [data objectAtIndex:i];
            
            NSLog(@"Emails: %@", str);
        }
    }
	else
    {
        for (int i = 0; i < [data count]; i++)
        {
            NSString *str = [data objectAtIndex:i];
            
            NSLog(@"IDs: %@", str);
        }
    }
}
*/
@end
