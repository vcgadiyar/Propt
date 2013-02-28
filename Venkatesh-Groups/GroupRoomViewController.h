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

#define kGetAllPropts @"http://www.courseeker.com/Propt/Scripts/Propt_Scripts.php?function=getAllPropts"
#define kGetProptsAfterTime @"http://courseeker.com/Propt/Scripts/Propt_Scripts.php?function=getProptsAfterGivenTimestamp&timestamp="

#define kGetInsertPropt @"http://www.courseeker.com/Propt/Scripts/Propt_Scripts.php?function=insertPropt"

#define kDeleteAllPropts @"http://www.courseeker.com/Propt/Scripts/Propt_Scripts.php?function=deleteAllPropts"


/*http://courseeker.com/Propt/Scripts/Propt_Scripts.php?function=insertPropt&group_id=432&propt_text=Why%20is%20this%20happening?&a=who&b=why&correct=Lebron&poster_id=423&start_time=4234&end_time=543*/


#define propt_text @"propt_text"
#define group_id @"group_id"
#define aOption @"a"
#define bOption @"b"
#define cOption @"c"
#define dOption @"d"
#define eOption @"e"
#define poster_id @"poster_id"
#define start_time @"start_time"
#define end_time @"end_time"


@interface GroupRoomViewController : UIViewController<UITableViewDelegate,UITableViewDataSource, UITextViewDelegate> {
    
        IBOutlet UITableView *MIMtableView;
    
    //TableView Related
    NSMutableArray *sectionArray;
    NSMutableArray *cellArray;
    NSMutableArray *cellCount;
    NSMutableArray *proptQuestions;
    Boolean choiceExpanding;
    Boolean choiceButtonClicked;
    Boolean firstRun;
    Boolean processingdata;
    int counter;
    int sectionExanded;
     NSDictionary *json;
    int lastTimestampFromDatadase;
    int choiceCount;
    UILabel *mainRoomLabel;
    
    Boolean createProptTextShowing;
    Boolean questionStartedText;
    Boolean choice1StartedText;
    Boolean choice2StartedText;
    Boolean choice3StartedText;
    Boolean choice4StartedText;
    Boolean choice5StartedText;
    
    Boolean initializing;
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

@property (strong, nonatomic) IBOutlet UIButton *addchoice;

@property (strong, nonatomic) IBOutlet UIButton *deletechoice;

@property (strong, nonatomic) IBOutlet UITextView *questionText;
@property (strong, nonatomic) IBOutlet UITextView *answerChoice1;
@property (strong, nonatomic) IBOutlet UITextView *answerChoice2;
@property (strong, nonatomic) IBOutlet UITextView *answerChoice3;
@property (strong, nonatomic) IBOutlet UITextView *answerChoice4;
@property (strong, nonatomic) IBOutlet UITextView *answerChoice5;

@property (strong, nonatomic) IBOutlet UILabel *mainRoomLabel;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *leavegroupbarbutton;

- (IBAction)leavegroupbarbutton:(id)sender;

@property (strong, nonatomic) NSURLConnection *postConnection;

- (IBAction)newbutton:(id)sender;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *grouplistButton;


@end



