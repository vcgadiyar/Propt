//
//  ViewController.h
//  Venkatesh-Groups
//
//  Created by Renaldo on 2/18/13.
//  Copyright (c) 2013 Renaldo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

- (IBAction)onClick:(id)sender;
@property NSArray *array;
@property (strong, nonatomic) IBOutlet UITableView *Populate;
@end
