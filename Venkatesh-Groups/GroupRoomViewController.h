//
//  GroupRoomViewController.h
//  Venkatesh-Groups
//
//  Created by Renaldo on 2/19/13.
//  Copyright (c) 2013 Renaldo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"
#import "ProptProperties.h"

@interface GroupRoomViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    
        IBOutlet UITableView *MIMtableView;
    
    //TableView Related
    NSMutableArray *sectionArray;
    NSMutableArray *cellArray;
    NSMutableArray *cellCount;
    NSMutableArray *proptQuestions;
    int counter;
}

@property(strong, nonatomic)IBOutlet UITableView *MIMtableView;
@property (strong, nonatomic) IBOutlet UIButton *addsection;
@property (strong, nonatomic) IBOutlet UIButton *addrow;
- (IBAction)addrowpress:(id)sender;
- (IBAction)insertSectionPressed:(id)sender;
- (IBAction)addrowPressed:(id)sender;


@property (strong, nonatomic) IBOutlet UITextField *sectionText;
@property (strong, nonatomic) IBOutlet UITextField *rowText;
@property (nonatomic, retain) NSMutableArray *proptQuestions;
@property (strong, nonatomic) IBOutlet UITextField *insertSectionText;
@property (strong, nonatomic) IBOutlet UIButton *insertSection;


@end



