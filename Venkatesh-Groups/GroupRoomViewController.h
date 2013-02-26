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
    Boolean choiceExpanding;
    Boolean choiceButtonClicked;
    Boolean firstRun;
    int counter;
    int sectionExanded;
}

@property(strong, nonatomic)IBOutlet UITableView *MIMtableView;
@property (strong, nonatomic) IBOutlet UIButton *addsection;
@property (strong, nonatomic) IBOutlet UIButton *addrow;
- (IBAction)addrowpress:(id)sender;
- (IBAction)insertSectionPressed:(id)sender;
- (IBAction)addrowPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *myProgView;
@property (strong, nonatomic) IBOutlet UIView *myProptView;

@property (strong, nonatomic) IBOutlet UITextField *sectionText;
@property (strong, nonatomic) IBOutlet UITextField *rowText;
@property (nonatomic, retain) NSMutableArray *proptQuestions;
@property (strong, nonatomic) IBOutlet UITextField *insertSectionText;
@property (strong, nonatomic) IBOutlet UIButton *insertSection;

@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addproptbarbutton;
@property (strong, nonatomic) IBOutlet UIToolbar *toolBarAtBottom;

@property (strong, nonatomic) IBOutlet UITextView *questionText;
@property (strong, nonatomic) IBOutlet UITextView *answerChoice1;
@property (strong, nonatomic) IBOutlet UITextView *answerChoice2;
@property (strong, nonatomic) IBOutlet UITextView *answerChoice3;
@property (strong, nonatomic) IBOutlet UITextView *answerChoice4;
@property (strong, nonatomic) IBOutlet UITextView *answerChoice5;




@end



