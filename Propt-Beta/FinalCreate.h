//
//  FinalCreate.h
//  Propt-Beta
//
//  Created by Propt Development on 2/24/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface FinalCreate : UIViewController
{
    NSMutableArray *name1;
    AppDelegate *appDelegate;
    
}
@property (strong, nonatomic) IBOutlet UITableView *Populate;
@property (strong, nonatomic) IBOutlet UITextField *gname;
@property(nonatomic, retain)NSMutableArray *name1;
- (NSString *)removeUnwanted:(NSString *)input;

- (IBAction)create_group:(id)sender;

@end
