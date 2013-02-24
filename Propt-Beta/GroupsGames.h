//
//  GroupsGames.h
//  Propt-Beta
//
//  Created by Propt Development on 2/21/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewGroup.h"
#import "Person.h"
//#import "ViewController.h"

@interface GroupsGames : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    int value;
    NewGroup *myVC;
    NSIndexPath* checkedIndexPath;
    //ViewController *pg1;

}
@property (strong, nonatomic) IBOutlet UINavigationBar *gName;
@property (nonatomic, retain) NSIndexPath* checkedIndexPath;
@property (strong, nonatomic)NewGroup *myVC;
//@property (strong, nonatomic)ViewController *pg1;
@property (strong, nonatomic) IBOutlet UINavigationItem *back;


@property (nonatomic, retain) IBOutlet UISegmentedControl *FGbar;
@property (nonatomic, retain) IBOutlet UITableView *Populate;
@property (strong, nonatomic) IBOutlet UIToolbar *upBar;
- (IBAction)createGroup:(id)sender;
- (IBAction)goto1:(id)sender;

@property NSMutableArray *array;
- (IBAction)onAction:(id)sender;

@end
