//
//  ViewController.h
//  Propt-Beta
//
//  Created by Propt Development on 2/21/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupsGames.h"

@interface ViewController : UIViewController<UIScrollViewDelegate, UITextFieldDelegate>
{
    
    IBOutlet UITextField *number;
    IBOutlet UITextField *name;
    CGPoint        offset;
    GroupsGames *myViewController;
    AppDelegate *appDelegate;
}
- (IBAction)onClick:(id)sender;
@property (strong, nonatomic)GroupsGames *myViewController;
//- (IBAction)switchView:(id)sender;


@end
