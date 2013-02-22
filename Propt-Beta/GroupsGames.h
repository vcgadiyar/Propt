//
//  GroupsGames.h
//  Propt-Beta
//
//  Created by Propt Development on 2/21/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewGroup.h"
//#import "ViewController.h"

@interface GroupsGames : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    
    NewGroup *myVC;
    //ViewController *pg1;

}
@property (strong, nonatomic) IBOutlet UINavigationBar *gName;

@property (strong, nonatomic)NewGroup *myVC;
//@property (strong, nonatomic)ViewController *pg1;
@property (strong, nonatomic) IBOutlet UINavigationItem *back;


@property (nonatomic, retain) IBOutlet UISegmentedControl *FGbar;
@property (nonatomic, retain) IBOutlet UITableView *Populate;
@property (strong, nonatomic) IBOutlet UIToolbar *upBar;
- (IBAction)createGroup:(id)sender;
- (IBAction)goto1:(id)sender;

@property NSArray *array;
- (IBAction)onAction:(id)sender;

@end
