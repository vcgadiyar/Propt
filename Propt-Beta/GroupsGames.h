//
//  GroupsGames.h
//  Propt-Beta
//
//  Created by Propt Development on 2/21/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupsGames : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
}


@property (strong, nonatomic) IBOutlet UILabel *plName;
@property (nonatomic, retain) IBOutlet UISegmentedControl *FGbar;
@property (nonatomic, retain) IBOutlet UITableView *Populate;

@property NSArray *array;
- (IBAction)onAction:(id)sender;

@end
