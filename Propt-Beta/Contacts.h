//
//  Contacts.h
//  Propt-Beta
//
//  Created by Propt Development on 2/22/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "NewGroup.h"
#import "FinalCreate.h"
#import "AppDelegate.h"

@interface Contacts : UIViewController{
    NSIndexPath* checkedIndexPath;
    boolean_t isFiltered;
    //NSMutableArray *personsArray;
    NSMutableArray *names;
    FinalCreate *myViewController;
    AppDelegate *appDelegate;
    
    
   
    
}
@property (strong, nonatomic) IBOutlet UITableView *Populate;
@property NSMutableArray *newarray;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray* allTableData;
@property (strong, nonatomic) NSMutableArray* filteredTableData;
@property(nonatomic, retain)NSMutableArray *names;


//- (IBAction)switchBack:(id)sender;

- (IBAction)createGp:(id)sender;

- (IBAction)switchBack:(Contacts *)ctr;

@end
