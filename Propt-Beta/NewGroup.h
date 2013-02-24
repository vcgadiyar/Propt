//
//  NewGroup.h
//  Propt-Beta
//
//  Created by Propt Development on 2/21/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import "Contacts.h"


@interface NewGroup : UIViewController{
    
    CGPoint        offset;
    Contacts *myVC;
}
@property (strong, nonatomic) IBOutlet UITextField *myTextfield;
- (IBAction)showPicker:(id)sender;
- (IBAction)backto2:(id)sender;

@end
