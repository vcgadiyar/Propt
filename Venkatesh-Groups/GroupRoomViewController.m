//
//  GroupRoomViewController.m
//  Venkatesh-Groups
//
//  Created by Renaldo on 2/19/13.
//  Copyright (c) 2013 Renaldo. All rights reserved.
//

#import "GroupRoomViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface GroupRoomViewController ()


@end

@implementation GroupRoomViewController

@synthesize  MIMtableView;

@synthesize sectionText;
@synthesize rowText;
@synthesize proptQuestions;
@synthesize button;
@synthesize myProgView;
@synthesize myProptView;
@synthesize toolBarAtBottom;
@synthesize questionText;
@synthesize answerChoice1;
@synthesize answerChoice2;
@synthesize answerChoice3;
@synthesize answerChoice4;
@synthesize answerChoice5;
@synthesize addchoice;
@synthesize deletechoice;
@synthesize postConnection;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    //Init the Arrays of the tableview
   // sectionArray=[[NSMutableArray alloc]initWithObjects:@"Section 1",@"Section 2",@"Section 3",@"Section 4",@"Section 5", nil];
    sectionArray=[[NSMutableArray alloc] init];
    cellArray=[[NSMutableArray alloc]init];
    cellCount=[[NSMutableArray alloc]init];
    
    
  
    proptQuestions = [[NSMutableArray alloc] init];
    ProptProperties *propts = [[ProptProperties alloc] init];
    
    NSMutableDictionary *choices = [[NSMutableDictionary alloc] init ];
    
    
   // [choices removeAllObjects];
    
    [choices setObject:@"Choice 1" forKey:@"a"];
    [choices setObject:@"Choice 2" forKey:@"b"];
    [choices setObject:@"Choice 3" forKey:@"c"];
    [choices setObject:@"Choice 4" forKey:@"d"];
    [choices setObject:@"Choice 5" forKey:@"e"];
    
    int z = 0;
    [propts setProperties:++z andGroupID:z+5 andPosterID:z+8 andStartTime:@"332" andEndTime:@"552" andOwner:@"Renaldo" andText:@"Who is the winner" andChoices:choices andCorrectAnswer:@"b" andSelectedAnswer:@"a"];
    
    //[proptQuestions addObject:propts];

    //------------
    propts = [[ProptProperties alloc] init];
    choices = [[NSMutableDictionary alloc] init ];

    
    [choices setObject:@"Hey 1" forKey:@"a"];
    [choices setObject:@"Hey 2" forKey:@"b"];
    [choices setObject:@"Hey 3" forKey:@"c"];
    [choices setObject:@"Hey 4" forKey:@"d"];
    [choices setObject:@"Hey 5" forKey:@"e"];
 
    [propts setProperties:++z andGroupID:z+5 andPosterID:z+8 andStartTime:@"332" andEndTime:@"552" andOwner:@"Renaldo" andText:@"Who is the winner2" andChoices:choices andCorrectAnswer:@"b" andSelectedAnswer:@"a"];
    
   // [proptQuestions addObject:propts];
    
     //------------
    
    propts = [[ProptProperties alloc] init];
    choices = [[NSMutableDictionary alloc] init ];
    
    [choices setObject:@"Bye 1" forKey:@"a"];
    [choices setObject:@"Bye 2" forKey:@"b"];
    [choices setObject:@"Bye 3" forKey:@"c"];
    [choices setObject:@"Bye 4" forKey:@"d"];
    [choices setObject:@"Bye 5" forKey:@"e"];
    
    [propts setProperties:++z andGroupID:z+5 andPosterID:z+8 andStartTime:@"332" andEndTime:@"552" andOwner:@"Renaldo" andText:@"Who is the winner3" andChoices:choices andCorrectAnswer:@"b" andSelectedAnswer:@"a"];
    
 //   [proptQuestions addObject:propts];
    
    //--------
    
    choiceCount = 2;
     processingdata = NO;
    lastTimestampFromDatadase =0;
    counter = 0;
    sectionExanded = -1;
    
    createProptTextShowing = NO;
    questionStartedText = NO;
    choice1StartedText= NO;
    choice2StartedText= NO;
    choice3StartedText= NO;
    choice4StartedText= NO;
    choice5StartedText= NO;
    
    self.MIMtableView.autoresizesSubviews = YES;
    choiceExpanding = NO;
    choiceButtonClicked = NO;
    firstRun = YES;
    initializing = YES;
    
    button= [[UIButton alloc] init];
   
    
   /* for(int i=0;i< [sectionArray count];i++)
    {
        NSMutableArray *_cellArray=[[NSMutableArray alloc]initWithObjects:@" Row 1",@" Row 2",@" Row 3",@" Row 4",@" Row 5", nil];
        [cellArray addObject:_cellArray];
        [cellCount addObject:[NSNumber numberWithInt:[_cellArray count]]];
    }
    
    
    
    down vote
    Please use following code.
    */
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainBackground.png"]];
    [tempImageView setFrame:self.MIMtableView.frame];
    
   // self.MIMtableView.backgroundView = tempImageView;
    
    
    //Now need to add this UIView to a controller
    //[self.view addSubview: viewPtr];
    

    
    
    
    myProptView = (UIView *)self.CreateAPropt;
    
    [self.view insertSubview:myProptView belowSubview:toolBarAtBottom];
    
    
    myProgView = (UIView *)self.LoadTopSectionView;
    
    [self.view addSubview:myProgView];
    
    [self.view sendSubviewToBack:myProgView];
    
    
    //[NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(getpropt) userInfo:nil repeats:YES];
    
    
   // [self RefreshPropts];
       
        [super viewDidLoad];
}

-(void)getpropt
{
    [NSThread detachNewThreadSelector:@selector(RetrieveDataAndSendToView) toTarget:self withObject:nil];
}

-(void)RetrieveDataAndSendToView
{
    if(processingdata == NO)
    {
        processingdata = YES;
        
//    NSMutableString *postString = [NSMutableString stringWithString:kGetProptsAfterTime];
       NSMutableString *postString = [NSMutableString stringWithString:kGetAllPropts]; 
        
        int timestamp = 0;
        
    if(lastTimestampFromDatadase == 0)
    {
        timestamp = 1;
    }
    else
    {
        timestamp = lastTimestampFromDatadase;
    }
    
        
   //[postString appendString:[NSString stringWithFormat:@"%d", timestamp]];
    
    [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURL *url = [NSURL URLWithString:postString];
    
    
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
        
        
    
    [self performSelectorOnMainThread:@selector(getData:) withObject:data waitUntilDone:YES];
    }
}

-(void) getData: (NSData *) data
{
    
    NSError *error;
    
    if([data length] > 0)
    {
        json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
       
        
        // latestpoints = [json objectForKey:@""]; //2
        NSUInteger index = 0;
        
        
        
        
        for (NSDictionary *d in json)
        {
            if(index == 0)
            {
                NSLog(@"First Time");
                index++;
            }
            
            NSString *singleID = [d objectForKey:@"ID"];
            
            singleID = [singleID stringByReplacingOccurrencesOfString:@"null"
                                                 withString:@""];
            
            
             NSString *posterID = [d objectForKey:@"Poster_ID"];
            NSString *singleName = @""; //[d objectForKey:@"name"];
            
            NSString *groupID = [d objectForKey:@"Group_ID"];
                        
            NSString *text = [d objectForKey:@"Propt_text"];
        
            NSString *a = [d objectForKey:@"a"];
            NSString *b = [d objectForKey:@"b"];
            NSString *c = [d objectForKey:@"c"];
            //c = [c stringByReplacingOccurrencesOfString:@"gff" withString:@" "];
            
            if([self stringIsEmpty:c] == YES)
            {
                c = @"";
            }
          
            
            NSString *_d = [d objectForKey:@"d"];
            if([self stringIsEmpty:_d] == YES)
            {
                _d = @"";
            }
            
            NSString *e = [d objectForKey:@"e"];
            if([self stringIsEmpty:e] == YES)
            {
                e = @"";
            }
            
             NSString *correctAnswer = [d objectForKey:@"Correct_answer"];
            if([self stringIsEmpty:correctAnswer] == YES)
            {
                correctAnswer = @"";
            }
            
             NSString *startTime = [d objectForKey:@"Start_time"];
            
            NSString *endTime = [d objectForKey:@"End_time"];
            
            ProptProperties *tempPropt = [[ProptProperties alloc] init];
            
            NSMutableDictionary *choices = [[NSMutableDictionary alloc] init ];
            
            
            [choices setObject:a forKey:@"a"];
            [choices setObject:b forKey:@"b"];
            [choices setObject:c forKey:@"c"];
            [choices setObject:_d forKey:@"d"];
            [choices setObject:e forKey:@"e"];
            
            [tempPropt setProperties:singleID andGroupID:groupID andPosterID:posterID andStartTime:startTime andEndTime:endTime andOwner:@"" andText:text andChoices:choices andCorrectAnswer:correctAnswer andSelectedAnswer:@"" ];
            
            [proptQuestions addObject:tempPropt];
            
            
            lastTimestampFromDatadase = [[NSDate date] timeIntervalSince1970];  
            
            
        }
        
        [self ProcessPropts];
    }
    

    
}

-(BOOL ) stringIsEmpty:(NSString *) aString {
    
    if ((NSNull *) aString == [NSNull null]) {
        return YES;
    }
    
    if (aString == nil) {
        return YES;
    } else if ([aString length] == 0) {
        return YES;
    } else {
        aString = [aString stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([aString length] == 0) {
            return YES;
        }
    }
    
    return NO;
}

-(void) ProcessPropts
{
    
    int counter = 0;
    
    if ([proptQuestions count] > 0) {
        
        [self RefreshPropts];

        
        // respondball.frame = basketballFrame;
       // [proptQuestions removeAllObjects];
        
        processingdata = NO;
                
    }
    else {
        processingdata = NO;
    }
    
       
}



-(UIView *)CreateAPropt
{
    
    UIView *proptView = [[UIView alloc] initWithFrame:CGRectMake(1, 450, 320, 400)];
    proptView.backgroundColor = [UIColor colorWithRed:(195/255.f) green:(237/255.f) blue:(255/255.f) alpha:1.0f];
    
    proptView.tag = 1;    // tag this view for later so we can remove it from recycled table cells
    
    int moveDistance = 31;
    
    //-----------------------------------
    //Propt Textbox
 
    
    //Text 1
    questionText=[[UITextView alloc]initWithFrame:CGRectMake(1, 1, 310, 49)];
    [questionText setBackgroundColor:[UIColor whiteColor]];
    [questionText setFont:[UIFont fontWithName:@"Arial-Bold" size:19]];
    
     [questionText setFont:[UIFont systemFontOfSize:15]];
    [questionText setTextColor:[UIColor blackColor]];
    [questionText setText:@"Enter Propt Question"];
    
    [questionText setUserInteractionEnabled:YES];
    questionText.tag = 0;
    
    questionText.layer.borderWidth = 1.0f;
    questionText.layer.borderColor = [[UIColor grayColor] CGColor];
    
    questionText.layer.cornerRadius = 6;
    
    questionText.delegate = self;
    
    [proptView addSubview:questionText];
    
    //-----------------------------------
    //Propt Coice 1
    
    //Text 1
     answerChoice1=[[UITextView alloc]initWithFrame:CGRectMake(1, 20 + moveDistance, 310, 25)];
    [answerChoice1 setBackgroundColor:[UIColor whiteColor]];
    [answerChoice1 setFont:[UIFont fontWithName:@"Arial-Bold" size:12]];
         [answerChoice1 setFont:[UIFont systemFontOfSize:15]];
    
    [answerChoice1 setTextColor:[UIColor blackColor]];
    [answerChoice1 setText:@"Enter Choice 1"];
    
    [answerChoice1 setUserInteractionEnabled:YES];
    
    answerChoice1.layer.borderWidth = 1.0f;
    answerChoice1.layer.borderColor = [[UIColor grayColor] CGColor];
    answerChoice1.tag = 1;
    
    
    answerChoice1.layer.cornerRadius = 6;
    
    answerChoice1.delegate = self;
    
    [proptView addSubview:answerChoice1];
    
    //-----------------------------------
    //Propt Choice 2
    
    moveDistance = moveDistance + 25;
    
    //Text 1
    answerChoice2=[[UITextView alloc]initWithFrame:CGRectMake(1, 20 + moveDistance, 310, 25)];
    [answerChoice2 setBackgroundColor:[UIColor whiteColor]];
    [answerChoice2 setFont:[UIFont fontWithName:@"Arial-Bold" size:12]];
     [answerChoice2 setFont:[UIFont systemFontOfSize:15]];
    
    [answerChoice2 setTextColor:[UIColor blackColor]];
    [answerChoice2 setText:@"Enter Choice 2"];
    
    [answerChoice2 setUserInteractionEnabled:YES];
    answerChoice2.tag = 2;
    
    answerChoice2.layer.borderWidth = 1.0f;
    answerChoice2.layer.borderColor = [[UIColor grayColor] CGColor];
    answerChoice2.layer.cornerRadius = 6;
    
    answerChoice2.delegate = self;
    
    [proptView addSubview:answerChoice2];
    
    //-----------------------------------
    //Propt Choice 3
    
    moveDistance = moveDistance + 25;
    
    //Text 1
    answerChoice3=[[UITextView alloc]initWithFrame:CGRectMake(1, 20 + moveDistance, 310, 25)];
    [answerChoice3 setBackgroundColor:[UIColor whiteColor]];
    [answerChoice3 setFont:[UIFont fontWithName:@"Arial-Bold" size:11]];
     [answerChoice3 setFont:[UIFont systemFontOfSize:15]];
    [answerChoice3 setTextColor:[UIColor blackColor]];
    [answerChoice3 setText:@"Enter Choice 3"];
    
    [answerChoice3 setUserInteractionEnabled:YES];
    answerChoice3.tag = 3;
    
    answerChoice3.layer.borderWidth = 1.0f;
    answerChoice3.layer.borderColor = [[UIColor grayColor] CGColor];
    answerChoice3.layer.cornerRadius = 6;
    [answerChoice3 setHidden:YES];
    
    answerChoice3.delegate = self;
    
    [proptView addSubview:answerChoice3];
    
    //-----------------------------------
    //Propt Choice 4
    
    moveDistance = moveDistance + 25;
    
    //Text 1
    answerChoice4=[[UITextView alloc]initWithFrame:CGRectMake(1, 20 + moveDistance, 310, 25)];
    [answerChoice4 setBackgroundColor:[UIColor whiteColor]];
    [answerChoice4 setFont:[UIFont fontWithName:@"Arial-Bold" size:16]];
    [answerChoice4 setFont:[UIFont systemFontOfSize:15]];
    
    [answerChoice4 setTextColor:[UIColor blackColor]];
    [answerChoice4 setText:@"Enter Choice 4"];
    
    [answerChoice4 setUserInteractionEnabled:YES];
    answerChoice4.tag = 4;
    
    answerChoice4.layer.borderWidth = 1.0f;
    answerChoice4.layer.borderColor = [[UIColor grayColor] CGColor];
    answerChoice4.layer.cornerRadius = 6;
    [answerChoice4 setHidden:YES];
    
    answerChoice4.delegate = self;
    
    [proptView addSubview:answerChoice4];
    
    //-----------------------------------
    //Propt Choice 5
    
    moveDistance = moveDistance + 25;
    
    //Text 1
    answerChoice5=[[UITextView alloc]initWithFrame:CGRectMake(1, 20 + moveDistance, 310, 25)];
    [answerChoice5 setBackgroundColor:[UIColor whiteColor]];
    [answerChoice5 setFont:[UIFont fontWithName:@"Arial-Bold" size:13]];
    [answerChoice5 setFont:[UIFont systemFontOfSize:15]];
    
    [answerChoice5 setTextColor:[UIColor blackColor]];
    [answerChoice5 setText:@"Enter Choice 5"];
    
    [answerChoice5 setUserInteractionEnabled:YES];
    
    answerChoice5.layer.borderWidth = 1.0f;
    answerChoice5.layer.borderColor = [[UIColor grayColor] CGColor];
    answerChoice5.layer.cornerRadius = 6;
    [answerChoice5 setHidden:YES];
    
    answerChoice5.delegate = self;
        answerChoice5.tag = 5;
    
    
    [proptView addSubview:answerChoice5];
    
    //--------------------------------------
    //Button
    UIButton *cancel=[UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame=CGRectMake(5, 190, 56, 27);
    
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal ];
    [cancel setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    
    [cancel.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    
    
    [cancel addTarget:self action:@selector(CancelProptClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [proptView addSubview:cancel];
    
    //-------------------------------------
    
    //Button
    UIButton *send=[UIButton buttonWithType:UIButtonTypeCustom];
    send.frame=CGRectMake(265, 190, 56, 27);
   
    [send setTitle:@"Send" forState:UIControlStateNormal ];
    [send setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    
    [send.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    
    
    [send addTarget:self action:@selector(SendProptClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [proptView addSubview:send];

    //-------------------------------------
    
    //Button
    addchoice=[UIButton buttonWithType:UIButtonTypeCustom];
    addchoice.frame=CGRectMake(70, 190, 82, 27);
    
    [addchoice setTitle:@"Add Choice" forState:UIControlStateNormal ];
    
    [addchoice setTitleColor: [UIColor colorWithRed:(53/255.f) green:(141/255.f) blue:(74/255.f) alpha:1.0f] forState:UIControlStateNormal];
    
    addchoice.backgroundColor = [UIColor whiteColor];
    
    [addchoice.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    
    [[addchoice layer] setBorderWidth:2.0f];
    [[addchoice layer] setBorderColor:[UIColor greenColor].CGColor];
    
    [addchoice addTarget:self action:@selector(AddProptOptionClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [proptView addSubview:addchoice];
    
    //-------------------------------------
    
    //Button
    deletechoice=[UIButton buttonWithType:UIButtonTypeCustom];
    deletechoice.frame=CGRectMake(160, 190, 97, 27);
    
    [deletechoice setTitle:@"Delete Choice" forState:UIControlStateNormal ];
    [deletechoice setTitleColor: [UIColor colorWithRed:(53/255.f) green:(141/255.f) blue:(74/255.f) alpha:1.0f] forState:UIControlStateNormal];
    
    deletechoice.backgroundColor = [UIColor whiteColor];
    
    [[deletechoice layer] setBorderWidth:2.0f];
    [[deletechoice layer] setBorderColor:[UIColor greenColor].CGColor];
    
    [deletechoice.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    
    
    [deletechoice addTarget:self action:@selector(DeleteProptOptionClicked:) forControlEvents:UIControlEventTouchUpInside];
     [deletechoice setHidden:YES];
    
    [proptView addSubview:deletechoice];
    
    
    
    return proptView;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"textViewDidBeginEditing");
    
    
    if(textView.tag == 0)
    {
        if(questionStartedText == NO)
        {
        [questionText setText:@""];
            questionStartedText =YES;
        }
    }
    else if(textView.tag == 1)
    {
        if(choice1StartedText == NO)
        {
        [answerChoice1 setText:@""];
            choice1StartedText = YES;
        }
    }
    else if(textView.tag == 2)
    {
        if(choice2StartedText == NO)
        {
            [answerChoice2 setText:@""];
            choice2StartedText = YES;
        }
    }
    else if(textView.tag == 3)
    {
        if(choice3StartedText == NO)
        {
            [answerChoice3 setText:@""];
            choice3StartedText = YES;
        }
    }
    else if(textView.tag == 4)
    {
        if(choice4StartedText == NO)
        {
            [answerChoice4 setText:@""];
            choice4StartedText = YES;
        }
    }
    else if(textView.tag == 5)
    {
        if(choice5StartedText == NO)
        {
            [answerChoice5 setText:@""];
            choice5StartedText = YES;
        }
    }
}



-(UIView *)LoadTopSectionView
{
    //Background Image
   /* UIImageView *sectionBackground=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"topSectionbackground.png"]];
    
    sectionBackground.frame=CGRectMake(0, 0, 323, 100);
    
    [topSection addSubview:sectionBackground];*/
    

     UIView *progView = [[UIView alloc] initWithFrame:CGRectMake(1, 1, 320, 63)];
    progView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    progView.tag = 1;    // tag this view for later so we can remove it from recycled table cells
   
    int moveDownAmount = 5;
    
   UIImageView *sectionBackground=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"topSectionbackground5.png"]];
    sectionBackground.frame=CGRectMake(0, -5, 320, 85);
    [progView addSubview:sectionBackground];
    
    UIImageView *mainProfileImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainProfileDefault.png"]];
    
    mainProfileImage.frame=CGRectMake(8, 16+moveDownAmount, 50, 50);
    [progView addSubview:mainProfileImage];
    
    
    ///=----------------------------
   // Profile LIne
    UIImageView *line=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"profileDivideLine.png"]];
    [line setAlpha:0.3f];
    
    line.frame=CGRectMake(108, 8, 1, 55);
    [progView addSubview:line];
    
    //--------------------------------------
    //Label
    UILabel *User=[[UILabel alloc]initWithFrame:CGRectMake(20, -5, 56, 27)];
    [User setBackgroundColor:[UIColor clearColor]];
    [User setFont:[UIFont fontWithName:@"Helvetica" size:11]];
    [User setTextColor:[UIColor whiteColor]];
    [User setText:@"User"];
    [progView addSubview:User];
    
    //--------------------------------------
    //Wins
    UILabel *Wins=[[UILabel alloc]initWithFrame:CGRectMake(58, 9 + moveDownAmount, 56, 27)];
    [Wins setBackgroundColor:[UIColor clearColor]];
    [Wins setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    [Wins setTextColor:[UIColor blueColor]];
    [Wins setText:@"34 W"];
    [progView addSubview:Wins];
    
    //--------------------------------------
    //Loss
    UILabel *Loss=[[UILabel alloc]initWithFrame:CGRectMake(58, 25 + moveDownAmount, 56, 27)];
    [Loss setBackgroundColor:[UIColor clearColor]];
    [Loss setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    [Loss setTextColor:[UIColor blueColor]];
    [Loss setText:@"14 L"];
    [progView addSubview:Loss];
    
    //--------------------------------------
    //Propts
    UILabel *propts=[[UILabel alloc]initWithFrame:CGRectMake(58, 41+moveDownAmount, 56, 27)];
    [propts setBackgroundColor:[UIColor clearColor]];
    [propts setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    [propts setTextColor:[UIColor blueColor]];
    [propts setText:@"5 Propts"];
    [progView addSubview:propts];
    
    
    //---------------------------------------------
    //Main Room Label
    
    //Label
    mainRoomLabel=[[UILabel alloc]initWithFrame:CGRectMake(120, -14, 200, 50)];
    [mainRoomLabel setBackgroundColor:[UIColor clearColor]];
    [mainRoomLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    [mainRoomLabel setTextColor:[UIColor whiteColor]];
    [mainRoomLabel setText:@"Chris Patriots Room"];
    [progView addSubview:mainRoomLabel];
    
    //----------------------------
    //User Score Icon
    
    //User Image
    UIImageView *userImage1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"userHeadIcon.png"]];
    
    [userImage1 setBackgroundColor:[UIColor lightGrayColor]];
    userImage1.frame=CGRectMake(120, 33+moveDownAmount, 29, 26);
    
    [progView addSubview:userImage1];
    
    //Label Wins
    UILabel *user1Wins=[[UILabel alloc]initWithFrame:CGRectMake(155, 15+moveDownAmount, 200, 50)];
    [user1Wins setBackgroundColor:[UIColor clearColor]];
    [user1Wins setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [user1Wins setTextColor:[UIColor blueColor]];
    [user1Wins setText:@"23 W"];
    [progView addSubview:user1Wins];
    
    //Label Losses
    UILabel *user1Losses=[[UILabel alloc]initWithFrame:CGRectMake(155, 27+moveDownAmount, 200, 50)];
    [user1Losses setBackgroundColor:[UIColor clearColor]];
    [user1Losses setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [user1Losses setTextColor:[UIColor blueColor]];
    [user1Losses setText:@"8 L"];
    [progView addSubview:user1Losses];
    
    //Label user1Name
    UILabel *user1Name=[[UILabel alloc]initWithFrame:CGRectMake(125, 0+moveDownAmount, 200, 50)];
    [user1Name setBackgroundColor:[UIColor clearColor]];
    [user1Name setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [user1Name setTextColor:[UIColor blackColor]];
    [user1Name setText:@"Mike"];
    [progView addSubview:user1Name];
    
    //----------------------------
    //User Score Icon
    
    int moveRightAmount = 67;
    
    //User Image
     userImage1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"userHeadIcon.png"]];
    
    [userImage1 setBackgroundColor:[UIColor lightGrayColor]];
    userImage1.frame=CGRectMake(120 + moveRightAmount, 33+moveDownAmount, 29, 26);
    
    [progView addSubview:userImage1];
    
    //Label Wins
    user1Wins=[[UILabel alloc]initWithFrame:CGRectMake(155 + moveRightAmount, 15+moveDownAmount, 200, 50)];
    [user1Wins setBackgroundColor:[UIColor clearColor]];
    [user1Wins setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [user1Wins setTextColor:[UIColor blueColor]];
    [user1Wins setText:@"7 W"];
    [progView addSubview:user1Wins];
    
    //Label Losses
    user1Losses=[[UILabel alloc]initWithFrame:CGRectMake(155 + moveRightAmount, 27+moveDownAmount, 200, 50)];
    [user1Losses setBackgroundColor:[UIColor clearColor]];
    [user1Losses setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [user1Losses setTextColor:[UIColor blueColor]];
    [user1Losses setText:@"1 L"];
    [progView addSubview:user1Losses];
    
    //Label user1Name
    user1Name=[[UILabel alloc]initWithFrame:CGRectMake(125 + moveRightAmount, 0+moveDownAmount, 200, 50)];
    [user1Name setBackgroundColor:[UIColor clearColor]];
    [user1Name setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [user1Name setTextColor:[UIColor blackColor]];
    [user1Name setText:@"Andrea"];
    [progView addSubview:user1Name];
    
    //----------------------------
    //User Score Icon
    
    moveRightAmount = moveRightAmount + 60;
    
    //User Image
    userImage1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"userHeadIcon.png"]];
    
    [userImage1 setBackgroundColor:[UIColor lightGrayColor]];
    userImage1.frame=CGRectMake(120 + moveRightAmount, 33+moveDownAmount, 29, 26);
    
    [progView addSubview:userImage1];
    
    //Label Wins
    user1Wins=[[UILabel alloc]initWithFrame:CGRectMake(155 + moveRightAmount, 15+moveDownAmount, 200, 50)];
    [user1Wins setBackgroundColor:[UIColor clearColor]];
    [user1Wins setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [user1Wins setTextColor:[UIColor blueColor]];
    [user1Wins setText:@"87 W"];
    [progView addSubview:user1Wins];
    
    //Label Losses
    user1Losses=[[UILabel alloc]initWithFrame:CGRectMake(155 + moveRightAmount, 27+moveDownAmount, 200, 50)];
    [user1Losses setBackgroundColor:[UIColor clearColor]];
    [user1Losses setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [user1Losses setTextColor:[UIColor blueColor]];
    [user1Losses setText:@"75 L"];
    [progView addSubview:user1Losses];
    
    //Label user1Name
    user1Name=[[UILabel alloc]initWithFrame:CGRectMake(125 + moveRightAmount, 0+moveDownAmount, 200, 50)];
    [user1Name setBackgroundColor:[UIColor clearColor]];
    [user1Name setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [user1Name setTextColor:[UIColor blackColor]];
    [user1Name setText:@"Saramha"];
    [progView addSubview:user1Name];
    

    
    
    //-----------------------------------------
    
    
   /* UILabel *activityLabel = [[UILabel alloc] init];
    activityLabel.text = NSLocalizedString(@"BBBB..", @"string1");
    activityLabel.backgroundColor = [UIColor grayColor];
    activityLabel.textColor = [UIColor whiteColor];
    activityLabel.font = [UIFont systemFontOfSize:14];
    [progView addSubview:activityLabel];
    activityLabel.frame = CGRectMake(5, 2, 70, 25);
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityIndicator startAnimating];
    [progView addSubview:activityIndicator];
    activityIndicator.frame = CGRectMake(70, 5, 20, 20);*/
    
    return progView;
}

-(void)textField1Active
{
    
}

-(void) RefreshPropts
{
  //  [sectionArray removeAllObjects];
    // [cellArray removeAllObjects];
    // [cellCount removeAllObjects];
    
    for(ProptProperties *item in proptQuestions)
    {
        if (item.Imported == NO) {
         
            item.Imported = YES;
        [sectionArray addObject:[item text]];
        
         int row = [sectionArray count]-1;
        
        NSMutableArray *_cellArray;
        
        if([[item choices] objectForKey:@"c"] == @"")
        {
        _cellArray =[[NSMutableArray alloc]initWithObjects:[[item choices] objectForKey:@"a"],[[item choices] objectForKey:@"b"], nil];
        }
        else if ([[item choices] objectForKey:@"d"] == @"")
        {
     
        _cellArray=[[NSMutableArray alloc]initWithObjects:[[item choices] objectForKey:@"a"],[[item choices] objectForKey:@"b"], [[item choices] objectForKey:@"c"], nil];
        }
        else if ([[item choices] objectForKey:@"e"] == @"")
        {
            
            _cellArray=[[NSMutableArray alloc]initWithObjects:[[item choices] objectForKey:@"a"],[[item choices] objectForKey:@"b"], [[item choices] objectForKey:@"c"],[[item choices] objectForKey:@"d"], nil];
        }
        else 
        {
            
            _cellArray=[[NSMutableArray alloc]initWithObjects:[[item choices] objectForKey:@"a"],[[item choices] objectForKey:@"b"], [[item choices] objectForKey:@"c"],[[item choices] objectForKey:@"d"], [[item choices] objectForKey:@"e"], nil];
        }
        
        
        [cellArray addObject:_cellArray];
        
        int cellArrayCount = [[cellArray objectAtIndex:row] count];
        
       // if(initializing == YES)
        {
            [cellCount addObject:  [NSNumber numberWithInt:0]];
        }
        }
       // else
        {
        
          //  [cellCount addObject:  [NSNumber numberWithInt:cellArrayCount]];
        }
    }
    
  //  if(initializing == YES)
    {
        
    [MIMtableView reloadData];
        
        initializing = NO;
    }
  //  else
    {
    
   // for(int i=0;i< [sectionArray count];i++)
    {
        //[self choiceSelected:i];
    }
    }
}
- (void)AddPropt
{    
    [sectionArray addObject:[sectionText text]];
   
    
    NSString * test = [[NSString alloc ] init];  
    
    test = sectionText.text;
    test =[test stringByAppendingFormat:@" "];
    test = [test stringByAppendingFormat: [NSString stringWithFormat:@"%d", counter]];

    NSIndexPath *selectedIndexPath = [MIMtableView indexPathForSelectedRow];
    //int row = selectedIndexPath;
    int row = [sectionArray count]-1;
        
  //  if ([cellArray objectAtIndex:row] == [NSNull null]) {
                
        NSMutableArray *_cellArray=[[NSMutableArray alloc]initWithObjects:rowText.text, nil];
        [cellArray addObject:_cellArray];
        
        int cellArrayCount = [[cellArray objectAtIndex:row] count];
    
       [cellCount addObject:  [NSNumber numberWithInt:cellArrayCount]];
        /* 
       // if ([cellCount objectAtIndex:row] == [NSNull null]) {
            
          //  NSMutableArray *_cellCount=[[NSMutableArray alloc]initWithObjects:[NSNumber numberWithInt:cellArrayCount], nil];
            [cellCount addObject:[NSNumber numberWithInt:cellArrayCount]];
            
           // int cellArrayCount = [[cellArray objectAtIndex:row] count];
            
            //[cellCount addObject:  [NSNumber numberWithInt:[_cellArray count]]];
       // }
       /* else
        {
            NSMutableArray *_cellArray=[[NSMutableArray alloc]initWithObjects:rowText, nil];
            [cellArray addObject:_cellArray];
            
        }*/
    //}
   /* else
    {
         NSMutableArray *_cellArray=[[NSMutableArray alloc]initWithObjects:rowText, nil];        
          [cellArray insertObject:_cellArray atIndex:row];    
        
    }*/

    
  //  NSIndexPath *path1 = [NSIndexPath indexPathForRow:cellArrayCount inSection:0]; //ALSO TRIED WITH indexPathRow:0
   // NSArray *indexArray = [NSArray arrayWithObjects:path1,nil];
//[self.MIMtableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
    
    // [tblSimpleTable insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationRight];
    
    [MIMtableView reloadData];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  rowHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return sectionHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //View with the button to expand and shrink and
    //Label to display the Heading.
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 199, 41)];
    
    ProptProperties *temppropt = [[ProptProperties alloc] init];
    
    temppropt = [proptQuestions objectAtIndex:section];
    
    NSString *letterTransformation = [[NSString alloc] init];
    letterTransformation = [temppropt.selectedAnswer stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if(section == 14)
    {
        int e =3;
    }
    
    //Background Image
    UIImageView *headerBg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"proptbackground.png"]];
    
    headerBg.frame=CGRectMake(0, 0, 323, 53);
    
    [headerView addSubview:headerBg];
    
        ////------------------------------------------------
    //Question Mark
    
    //Label
    UILabel *questionMark=[[UILabel alloc]initWithFrame:CGRectMake(11, -4, 15, 24)];
     [questionMark setBackgroundColor:[UIColor clearColor]];
     [questionMark setFont:[UIFont fontWithName:@"Helvetica" size:6]];
     [questionMark setTextColor:[UIColor blackColor]];
    [questionMark setText:@"?"];
     [headerView addSubview:questionMark];
    
    ////------------------------------------------------
    
    //Question Mark
    
    //Label
    UILabel *User=[[UILabel alloc]initWithFrame:CGRectMake(20, 28, 56, 27)];
    [User setBackgroundColor:[UIColor clearColor]];
    [User setFont:[UIFont fontWithName:@"Helvetica" size:11]];
    [User setTextColor:[UIColor blackColor]];
    [User setText:@"User"];
    [headerView addSubview:User];
    
    ////------------------------------------------------
    
    //Votes
    
    //Label
    UILabel *votes=[[UILabel alloc]initWithFrame:CGRectMake(260, 30, 56, 27)];
    [votes setBackgroundColor:[UIColor clearColor]];
    [votes setFont:[UIFont fontWithName:@"Helvetica" size:11]];
    [votes setTextColor:[UIColor colorWithRed:(61/255.f) green:(151/255.f) blue:(217/255.f) alpha:1.0f]];
    [votes setText:@" "];
    [headerView addSubview:votes];
    

    
    //--------------------------------------------------
    //Thought Bubble
    UIImageView *thoughtBubble=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"questionBoxNoText.png"]];
    
    thoughtBubble.frame=CGRectMake(4, -1, 27, 23);
    
    [headerView addSubview:thoughtBubble];
    
    //--------------------------------------------------
    //User Image
    UIImageView *userImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"userHeadIcon.png"]];
    
    [userImage setBackgroundColor:[UIColor lightGrayColor]];
    userImage.frame=CGRectMake(23, 6, 29, 26);
    
    [headerView addSubview:userImage];
    
    //--------------------------------------------------
    //User Image
    UIImageView *votesImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"votesIcon.png"]];
    
    votesImage.frame=CGRectMake(231, 26, 43, 38);
    
    [headerView addSubview:votesImage];
    
    //--------------------------------------------------
    //User Image
    
    if([letterTransformation length] != 0)
    {
        UIImageView *predictBackgroundBox=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"answeredChoiceBackground.png"]];
        
        predictBackgroundBox.frame=CGRectMake(62, 34, 109, 18);
        
        [headerView addSubview:predictBackgroundBox];
    }
    else
    {
    UIImageView *predictBackgroundBox=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"answerBoxBackground.png"]];
    
    predictBackgroundBox.frame=CGRectMake(62, 34, 109, 18);
    
    [headerView addSubview:predictBackgroundBox];
    }
    
    ////------------------------------------------------
    
    //Predict Label
    
    if([letterTransformation length] != 0)
    {
        
    //Label
    UILabel *predict=[[UILabel alloc]initWithFrame:CGRectMake(84, 30, 87, 27)];
    [predict setBackgroundColor:[UIColor clearColor]];
    [predict setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    [predict setTextColor:[UIColor whiteColor]];
    [predict setText:@"Answered!"];
    [headerView addSubview:predict];
    
    }
    else
    {
        //Label
        UILabel *predict=[[UILabel alloc]initWithFrame:CGRectMake(84, 30, 87, 27)];
        [predict setBackgroundColor:[UIColor clearColor]];
        [predict setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [predict setTextColor:[UIColor blackColor]];
        [predict setText:@"Predict |"];
        [headerView addSubview:predict];
    }
    ////----------------------------------------------
    //Button
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(70, 31, 80, 27);
    button.tag=section+1;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"shrinkLong.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"shrinkLong.png"] forState:UIControlStateSelected];
    
    if([[cellCount objectAtIndex:section] intValue]==0) button.selected=NO;
    else button.selected=YES;
    
    [headerView addSubview:button];
    
    
    
    ////------------------------------------------------
    
    //Propt Textbox
    
    //Label
    UITextView *text=[[UITextView alloc]initWithFrame:CGRectMake(57, -6, 259, 49)];
    [text setBackgroundColor:[UIColor clearColor]];
    [text setFont:[UIFont fontWithName:@"Arial-Bold" size:11]];
    [text setTextColor:[UIColor colorWithRed:(48/255.f) green:(104/255.f) blue:(198/255.f) alpha:1.0f]];
    [text setText:[sectionArray objectAtIndex:section]];
    
    [text setUserInteractionEnabled:NO];
    [headerView addSubview:text];
    
    ////------------------------------------------------
    
    //Clear button
    
    if([letterTransformation length] != 0)
    {
        
        ////----------------------------------------------
        //Button
        UIButton *clear=[UIButton buttonWithType:UIButtonTypeCustom];
        clear.frame=CGRectMake(174, 35, 49, 20);
        clear.tag=section+1;
        [clear setTitle:@"Clear" forState:UIControlStateNormal ];
        [clear setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
        clear.titleLabel.font = [UIFont systemFontOfSize:13];
        
        
        [clear addTarget:self action:@selector(buttonClearClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [headerView addSubview:clear];
        
    }
    else
    {
        //Label
        UIButton *clear=[UIButton buttonWithType:UIButtonTypeCustom];
        clear.frame=CGRectMake(174, 35, 49, 20);
        clear.tag=section+1;
        [clear setTitle:@" " forState:UIControlStateNormal ];
        [clear setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
        clear.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [clear addTarget:self action:@selector(buttonClearClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [headerView addSubview:clear];
    }
    //Label
    /*UILabel *headerTitle=[[UILabel alloc]initWithFrame:CGRectMake(30, 7, 300, 30)];
    [headerTitle setBackgroundColor:[UIColor clearColor]];
    [headerTitle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    [headerTitle setTextColor:[UIColor darkGrayColor]];
    [headerTitle setText:[sectionArray objectAtIndex:section]];
    [headerView addSubview:headerTitle];*/
    

    
    
    return  headerView;

       
}


/*
- (void)adjustTableHeaderHeight:(NSUInteger)newHeight{
    NSUInteger oldHeight = self.frame.size.height;
    NSInteger originChange = oldHeight - newHeight;
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y,
                            self.frame.size.width,
                            newHeight);
    
    for (UIView *view in [(UITableView *)self.superview subviews]) {
        if ([view isKindOfClass:[self class]]) {
            continue;
        }
        view.frame = CGRectMake(view.frame.origin.x,
                                view.frame.origin.y - originChange,
                                view.frame.size.width,
                                view.frame.size.height);
    }
    
    [UIView commitAnimations];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    [(UITableView *)self.superview setTableHeaderView:self];
}
*/


-(IBAction)buttonClicked:(id)sender
{
    for(int i=0;i< [sectionArray count];i++)
    {
        [self choiceSelected:i];
    }
    
    UIButton *button=(UIButton *)sender;
    NSInteger _index=[sender tag]-1;
    choiceButtonClicked = YES;
    
    if([button isSelected])
    {
        button.selected=NO;
       // choiceButtonClicked = NO;

        
        [self choiceSelected:_index];
        
        
        // [self.MIMtableView beginUpdates];
       // [self.MIMtableView deleteRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
        
        //[self.MIMtableView endUpdates];
        
      //  self.MIMtableView viewForBaselineLayout.view =  GetUpdatedHeader: _index;
        
        
    }
    else
    {
        choiceExpanding = YES;
        button.selected=YES;
        
        int cellArrayIndex = [[cellArray objectAtIndex:_index]count];
        
        [cellCount replaceObjectAtIndex:_index withObject:[NSNumber numberWithInt:cellArrayIndex]];
        
       NSIndexPath *path1 = [NSIndexPath indexPathForRow:0 inSection:_index]; //ALSO TRIED WITH
        NSArray *indexArray = [NSArray arrayWithObjects:path1,nil];
        
                
       
        
            [MIMtableView reloadSections:[NSIndexSet indexSetWithIndex:_index]  withRowAnimation:UITableViewRowAnimationFade];
        
        ProptProperties *temppropt = [[ProptProperties alloc] init];
         
         temppropt = [proptQuestions objectAtIndex:_index];
         
         NSString *letterTransformation = [[NSString alloc] init];
         int indexTranslation = -1;
         
         letterTransformation = temppropt.selectedAnswer;
         
         if(letterTransformation == [[temppropt choices] objectForKey:@"a"])
         {
         indexTranslation = 0;
         }
         else if(letterTransformation == [[temppropt choices] objectForKey:@"b"])
         {
         indexTranslation = 1;
         }
         else if(letterTransformation == [[temppropt choices] objectForKey:@"c"])
         {
         indexTranslation = 2;
         }
         else if(letterTransformation == [[temppropt choices] objectForKey:@"d"])
         {
         indexTranslation = 3;
         }
         else if(letterTransformation == [[temppropt choices] objectForKey:@"e"])
         {
         indexTranslation = 4;
         }
         
         
         
         if(indexTranslation != -1)
         {
         NSIndexPath *indexPath = [NSIndexPath indexPathForRow:indexTranslation inSection:_index];
         [self.MIMtableView  selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
         [self tableView:self.MIMtableView  didSelectRowAtIndexPath:indexPath];
 
         }

        
    
    }
    
  

     choiceButtonClicked = NO;
   // NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:1];
 //   [self.MIMtableView  selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
   // [self tableView:self.MIMtableView  didSelectRowAtIndexPath:indexPath];
    
    
}

-(IBAction)buttonClearClicked:(id)sender
{
   
    
    UIButton *button=(UIButton *)sender;
    NSInteger _index=  [sender tag]-1;
  
  //  if(sectionExanded != -1)
    {
    ProptProperties *temppropt = [[ProptProperties alloc] init];
    
    temppropt = [proptQuestions objectAtIndex:_index];
    
    NSString *letterTransformation = [[NSString alloc] init];
        
    temppropt.selectedAnswer = @"";
    
    [MIMtableView reloadSections:[NSIndexSet indexSetWithIndex:_index]  withRowAnimation:UITableViewRowAnimationFade ];
    }

   // sectionExanded = -1;
    
    
}

-(void)choiceSelected:(NSInteger) choiceIndex
{
    
    [cellCount replaceObjectAtIndex:choiceIndex withObject:[NSNumber numberWithInt:0]];
    
    NSIndexPath *path1 = [NSIndexPath indexPathForRow:0 inSection:choiceIndex]; //ALSO TRIED WITH
    NSArray *indexArray = [NSArray arrayWithObjects:path1,nil];
    
    [MIMtableView reloadSections:[NSIndexSet indexSetWithIndex:choiceIndex]  withRowAnimation:UITableViewRowAnimationFade ];
    
    
}


//datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    
    return [sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //if(initializing == YES)
    {
      //  return 0;
    }
   // else
    {
        int x = [[cellCount objectAtIndex:section] intValue];
        return x;
    }
    
    
     //return [sectionArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
   
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    if(choiceButtonClicked == NO && choiceExpanding == YES)
    {
        choiceExpanding = NO;
    }
   
    
    ProptProperties *temppropt = [[ProptProperties alloc] init];
    
    temppropt = [proptQuestions objectAtIndex:section];
    
    NSString *letterTransformation = [[NSString alloc] init];
    
    if(row == 0)
    {
        letterTransformation = @"a";
    }
    else if(row == 1)
    {
        letterTransformation = @"b";
    }
    else if(row == 2)
    {
        letterTransformation = @"c";
    }
    else if(row == 3)
    {
        letterTransformation = @"d";
    }
    else if(row == 4)
    {
        letterTransformation = @"e";
    }
    
    temppropt.selectedAnswer = [temppropt.choices objectForKey:letterTransformation];
    
    [proptQuestions replaceObjectAtIndex:section withObject:temppropt];
    
    if(choiceExpanding == NO)
    {
         [self choiceSelected:section];
        
        
    }
    
    //choiceButtonClicked = NO;
        
    
    
    return  cell;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    
    //Add the Bg Image to the cell
    
    //Add the Label
    UILabel *cellTitle=[[UILabel alloc]initWithFrame:CGRectMake(0, -10, 330, 30)];
    [cellTitle setBackgroundColor:[UIColor colorWithRed:(183/255.f) green:(209/255.f) blue:(255/255.f) alpha:1.0f]];
    [cellTitle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    [cellTitle setTextColor:[UIColor blackColor]];
    
    NSInteger section = indexPath.section;
    NSInteger row1 = indexPath.row;
    
    NSInteger rowsec = [tableView numberOfRowsInSection:section];
    
    [cellTitle setText:[[cellArray objectAtIndex:section] objectAtIndex:row1]];

    [cell.contentView addSubview:cellTitle];
    
    // CGRect newFrame = cell.frame;
    // newFrame.size.height = newFrame.size.height - 200;
    // cell.frame = newFrame;
    
    // self.MIMtableView.tableHeaderView = headerView;
    
    
    return  cell;
    
    //----------------------
    
   // UITableViewCell *cell;
	/*
	//if (indexPath.section == 0)
	{
		cell = [tableView dequeueReusableCellWithIdentifier:@"ProptCell"];
		if (!cell)
			cell = [[[NSBundle mainBundle] loadNibNamed:@"switchcell" owner:self options:nil] lastObject];
		[(UITextView *)[cell viewWithTag:103] setText:[NSString stringWithFormat:@"Testing... %d\n", indexPath.row + 1]];
	}
	else if (indexPath.section == 1)
	{
		if (indexPath.row == 0)
		{
			cell = [tView dequeueReusableCellWithIdentifier:@"LibertyCell"];
			if (!cell)
				cell = [[[NSBundle mainBundle] loadNibNamed:@"libertycell" owner:self options:nil] lastObject];
		}
		else if (indexPath.row == 1)
		{
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SubtitleCell"];
			cell.textLabel.text = @"Hello World";
			cell.detailTextLabel.text = @"Subtitle World";
		}
	}*/
  
    
    //--------------------
    
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
      
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addrowpress:(id)sender {
}

- (IBAction)SendProptClicked:(id)sender {
    
    if ([self constructPostMessage] == YES) {
        
         [self.view endEditing:TRUE];
        
    }
    else
    {
        
    }
    
    
    
}

-(Boolean) constructPostMessage
{
            
        NSMutableArray * dataArray = [[NSMutableArray alloc] init];  
    
    if( ([[questionText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) || ([[answerChoice1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) || ([[answerChoice2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]))
         {
         
             UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Cannot have blank text for question, or answer choices 1 and 2!"
                                                               message:@"Blank Text"
                                                              delegate:nil
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
             
             [message show];
             return NO;
   
         }
    else
    {
        
        // letterTransformation = [temppropt.selectedAnswer stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        
        [dataArray addObject:[NSString stringWithFormat:@"%@", questionText.text]];
        [dataArray addObject:[NSString stringWithFormat:@"%@", answerChoice1.text]];
        [dataArray addObject:[NSString stringWithFormat:@"%@", answerChoice2.text]];
        // [dataArray addObject:[NSString stringWithFormat:@"%@", answerChoice3.text]];
        // [dataArray addObject:[NSString stringWithFormat:@"%@", answerChoice4.text]];
        // [dataArray addObject:[NSString stringWithFormat:@"%@", answerChoice5.text]];
        [dataArray addObject:[NSString stringWithFormat:@"%d", 1]];
        
        [dataArray addObject:[NSString stringWithFormat:@"%d", 1]];
        
        [dataArray addObject:[NSString stringWithFormat:@"%d", [[NSDate date] timeIntervalSince1970]]];
        
        [dataArray addObject:[NSString stringWithFormat:@"%d", [[NSDate date] timeIntervalSince1970] + 120]];
        
        
        [NSThread detachNewThreadSelector:@selector(postMessage:) toTarget:self withObject:dataArray];
        
        return YES;
    
    }
   
}


-(void) postMessage: (NSMutableArray*) data
{
    if([data objectAtIndex:0] != nil && [data objectAtIndex:1] != nil)
    {
        NSMutableString *postString = [NSMutableString stringWithString:kGetInsertPropt];
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", propt_text, [data objectAtIndex:0]]];
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", aOption, [data objectAtIndex:1]]];
        
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", bOption,[data objectAtIndex:2]]];
        
        //[postString appendString:[NSString stringWithFormat:@"&%@=%@", cOption,[data objectAtIndex:3]]];
        
        //[postString appendString:[NSString stringWithFormat:@"&%@=%@", dOption,[data objectAtIndex:4]]];
        
        
       // [postString appendString:[NSString stringWithFormat:@"&%@=%@", eOption,[data objectAtIndex:5]]];
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", poster_id,[data objectAtIndex:3]]];
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", group_id,[data objectAtIndex:4]]];
        
          [postString appendString:[NSString stringWithFormat:@"&%@=%@", start_time,[data objectAtIndex:5]]];
        
          [postString appendString:[NSString stringWithFormat:@"&%@=%@", end_time,[data objectAtIndex:6]]];
        
        
        [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
        
        [request setHTTPMethod:@"POST"];
        
        
        postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
        
    }
}



- (IBAction)AddProptOptionClicked:(id)sender {
    
    if(choiceCount == 2)
    {
          [answerChoice3 setHidden:NO];
        [deletechoice setHidden:NO];
        choiceCount = 3;
    }
    else if(choiceCount == 3)
    {
        [answerChoice4 setHidden:NO];
        choiceCount = 4;
    }
    else if(choiceCount == 4)
    {
        [answerChoice5 setHidden:NO];
        choiceCount = 5;
        [addchoice setHidden:YES];
    }
    
    
}

- (IBAction)DeleteProptOptionClicked:(id)sender {
    
    if(choiceCount == 2)
    {
        //[answerChoice3 setHidden:NO];
        //choiceCount = 3;
        [answerChoice4 setHidden:YES];
        [deletechoice setHidden:YES];
    }
    else if(choiceCount == 3)
    {
        [answerChoice3 setHidden:YES];
        choiceCount = 2;
        [deletechoice setHidden:YES];
    }
    else if(choiceCount == 4)
    {
        [answerChoice4 setHidden:YES];
        choiceCount = 3;
    }
    else if(choiceCount == 5)
    {
        [answerChoice5 setHidden:YES];
        choiceCount = 4;
        [addchoice setHidden:NO];
    }
    
    
}


- (IBAction)CancelProptClicked:(id)sender {
    
    
    [self HidePropt];
    
    [mainRoomLabel setTextColor:[UIColor whiteColor]];
    [mainRoomLabel setText:@"Chris Patriots Room"];
    


    
}

-(void)HidePropt
{
    [UIView beginAnimations:@"UIBase Hide" context:nil];
    
    [UIView setAnimationDuration:.5];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(MoveDidStop:finished:context:)];
    
    myProptView.frame = CGRectMake(1, 450, 320, 400);
    
    firstRun = NO;
    
    [UIView commitAnimations];
}

- (IBAction)insertSectionPressed:(id)sender {
   
   
    
}


- (void)MoveDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if (firstRun == NO) {
        [self.view endEditing:TRUE];
        
        questionStartedText = NO;
        choice1StartedText= NO;
        choice2StartedText= NO;
        choice3StartedText= NO;
        choice4StartedText= NO;
        choice5StartedText= NO;
        
        [answerChoice3 setHidden:YES];
        [answerChoice4 setHidden:YES];
        [answerChoice5 setHidden:YES];
        
        
        [questionText setText:@""];
        [answerChoice1 setText:@"Enter Choice"];
        [answerChoice2 setText:@"Enter Choice"];
        [answerChoice3 setText:@"Enter Choice"];
        [answerChoice4 setText:@"Enter Choice"];
        [answerChoice5 setText:@"Enter Choice"];
        
        [deletechoice setHidden:YES];
        [addchoice setHidden:NO];
    }
   
}


- (IBAction)addsectionpress:(id)sender {
    
    [self AddPropt];
    
    
    
    
    
}
- (IBAction)uibarbuttonClicked:(id)sender {
    
    
    [UIView beginAnimations:@"UIBase Hide" context:nil];
    createProptTextShowing = YES;
    
   // if(firstRun == YES)
    {
        [questionText becomeFirstResponder];
        
        [UIView setAnimationDuration:.5];
        [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(MoveDidStop:finished:context:)];
        
        myProptView.frame = CGRectMake(1, 20, 320, 400);
        
        firstRun = YES;
        
        
        [mainRoomLabel setTextColor:[UIColor whiteColor]];
        [mainRoomLabel setText:@"Enter Propt Question"];
        
    }
   /* else
    {
        //   [questionText becomeFirstResponder];
        
        [UIView setAnimationDuration:.5];
        [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(MoveDidStop:finished:context:)];
        
        myProptView.frame = CGRectMake(1, 450, 320, 400);
        
        firstRun = NO;
        
       
        
    }*/

[UIView commitAnimations];
    
    
}


- (IBAction)leavegroupbarbutton:(id)sender {
    
   // [sectionArray removeAllObjects];
   // [cellArray removeAllObjects];
   // [cellCount removeAllObjects];
  //  [proptQuestions removeAllObjects];
    
    
   // [MIMtableView reloadData];
    
    [self getpropt];
}
- (IBAction)groupListPressed:(id)sender {
    
    NSMutableString *postString = [NSMutableString stringWithString:kDeleteAllPropts];

    
    [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
    
   // [request setHTTPMethod:@"POST"];
    
    
   // postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
}

- (IBAction)newbutton:(id)sender {
    
    NSMutableString *postString = [NSMutableString stringWithString:kDeleteAllPropts];
    
    
    [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
    
    [request setHTTPMethod:@"POST"];
    
    
    postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
}
@end
