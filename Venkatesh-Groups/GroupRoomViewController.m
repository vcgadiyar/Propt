//
//  GroupRoomViewController.m
//  Venkatesh-Groups
//
//  Created by Renaldo on 2/19/13.
//  Copyright (c) 2013 Renaldo. All rights reserved.
//

#import "GroupRoomViewController.h"


@interface GroupRoomViewController ()


@end

@implementation GroupRoomViewController

@synthesize  MIMtableView;

@synthesize sectionText;
@synthesize rowText;
@synthesize proptQuestions;

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
    [propts setProperties:++z andOwner:@"Renaldo" andText:@"Who is the winner" andChoices:choices andCorrectAnswer:@"b" andSelectedAnswer:@""];
    
    [proptQuestions addObject:propts];
    
    //------------
    propts = [[ProptProperties alloc] init];
    choices = [[NSMutableDictionary alloc] init ];

    
    [choices setObject:@"Hey 1" forKey:@"a"];
    [choices setObject:@"Hey 2" forKey:@"b"];
    [choices setObject:@"Hey 3" forKey:@"c"];
    [choices setObject:@"Hey 4" forKey:@"d"];
    [choices setObject:@"Hey 5" forKey:@"e"];
 
    [propts setProperties:++z andOwner:@"Renaldo2" andText:@"Who is the winner2" andChoices:choices andCorrectAnswer:@"b2" andSelectedAnswer:@""];
    
    [proptQuestions addObject:propts];
    
     //------------
    
    propts = [[ProptProperties alloc] init];
    choices = [[NSMutableDictionary alloc] init ];
    
    [choices setObject:@"Bye 1" forKey:@"a"];
    [choices setObject:@"Bye 2" forKey:@"b"];
    [choices setObject:@"Bye 3" forKey:@"c"];
    [choices setObject:@"Bye 4" forKey:@"d"];
    [choices setObject:@"Bye 5" forKey:@"e"];
    
    [propts setProperties:++z andOwner:@"Renaldo2" andText:@"Who is the winner3" andChoices:choices andCorrectAnswer:@"b3" andSelectedAnswer:@""];
    
    [proptQuestions addObject:propts];
    
    //--------
    
  
    
    counter = 0;
    
   /* for(int i=0;i< [sectionArray count];i++)
    {
        NSMutableArray *_cellArray=[[NSMutableArray alloc]initWithObjects:@" Row 1",@" Row 2",@" Row 3",@" Row 4",@" Row 5", nil];
        [cellArray addObject:_cellArray];
        [cellCount addObject:[NSNumber numberWithInt:[_cellArray count]]];
    }
    
    [MIMtableView reloadData];*/
    
        [super viewDidLoad];
}


-(void) RefreshPropts
{
    
    for(ProptProperties *item in proptQuestions)
    {
        [sectionArray addObject:[item text]];
        
         int row = [sectionArray count]-1;
        
        NSMutableArray *_cellArray=[[NSMutableArray alloc]initWithObjects:[[item choices] objectForKey:@"a"],[[item choices] objectForKey:@"b"], [[item choices] objectForKey:@"c"], nil];
     
        [cellArray addObject:_cellArray];
        
        int cellArrayCount = [[cellArray objectAtIndex:row] count];
        
        [cellCount addObject:  [NSNumber numberWithInt:cellArrayCount]];
    }

    [MIMtableView reloadData];
    
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
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 323, 44)];
    
    
    //Background Image
    UIImageView *headerBg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sectionBg.png"]];
    [headerView addSubview:headerBg];
    
    //Button
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 7, 30, 30);
    button.tag=section+1;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"shrink.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"disclosure.png"] forState:UIControlStateSelected];
    
    if([[cellCount objectAtIndex:section] intValue]==0)
    {
        button.selected=YES;
    }
    else
    {
        button.selected=NO;
        
        
    }
    
    [headerView addSubview:button];
    
    //Label
    UILabel *headerTitle=[[UILabel alloc]initWithFrame:CGRectMake(30, 7, 300, 30)];
    [headerTitle setBackgroundColor:[UIColor clearColor]];
    [headerTitle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    [headerTitle setTextColor:[UIColor darkGrayColor]];
    
    int x = (arc4random() % (10-0+1));
    [headerTitle setText:[sectionArray objectAtIndex:section]];   //[NSString stringWithFormat:@"%d", x]];
    [headerView addSubview:headerTitle];
    
    
   
    
    
    return  headerView;
}


-(IBAction)buttonClicked:(id)sender
{
   
    UIButton *button=(UIButton *)sender;
    NSInteger _index=[sender tag]-1;
    
    if(![button isSelected])
    {
        [cellCount replaceObjectAtIndex:_index withObject:[NSNumber numberWithInt:0]];
        NSIndexPath *path1 = [NSIndexPath indexPathForRow:0 inSection:_index]; //ALSO TRIED WITH
        NSArray *indexArray = [NSArray arrayWithObjects:path1,nil];
        
       
        
        // [self.MIMtableView beginUpdates];
       // [self.MIMtableView deleteRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
        
        //[self.MIMtableView endUpdates];
        
      //  self.MIMtableView viewForBaselineLayout.view =  GetUpdatedHeader: _index;
    }
    else
    {
        int cellArrayIndex = [[cellArray objectAtIndex:_index]count];
        
        [cellCount replaceObjectAtIndex:_index withObject:[NSNumber numberWithInt:cellArrayIndex]];
        
       NSIndexPath *path1 = [NSIndexPath indexPathForRow:0 inSection:_index]; //ALSO TRIED WITH
        NSArray *indexArray = [NSArray arrayWithObjects:path1,nil];
        
                
       
        
        
      // [self.MIMtableView beginUpdates];
      //  [self.MIMtableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
        
     //   [self.MIMtableView endUpdates];
    }
    
  
    [MIMtableView reloadSections:[NSIndexSet indexSetWithIndex:_index]  withRowAnimation:UITableViewRowAnimationMiddle];
    
    
}


//datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    
    return [sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    /*if([cellCount count] == 0)
    {
        return 0;
    }
    else*/
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
     cell.selected = YES;
    
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
    
    [proptQuestions insertObject:temppropt atIndex:section];
    
    return  cell;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    
    //Add the Bg Image to the cell
    
    //Add the Label
    UILabel *cellTitle=[[UILabel alloc]initWithFrame:CGRectMake(15, 7, 300, 30)];
    [cellTitle setBackgroundColor:[UIColor clearColor]];
    [cellTitle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    [cellTitle setTextColor:[UIColor darkGrayColor]];
    
    NSInteger section = indexPath.section;
    [cellTitle setText:[[cellArray objectAtIndex:section] objectAtIndex:indexPath.row]];
    
    //[cellTitle setText:[sectionArray objectAtIndex:indexPath.row]];
   
    ProptProperties *temppropt = [[ProptProperties alloc] init];
    
    temppropt = [proptQuestions objectAtIndex:section];
    
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
       NSIndexPath *indexPath = [NSIndexPath indexPathForRow:indexTranslation inSection:section];
        [self.MIMtableView  selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        [self tableView:self.MIMtableView  didSelectRowAtIndexPath:indexPath];
        
      //  cell.selected = YES;
    }
    
    
    
    
    [cell.contentView addSubview:cellTitle];
    
    return  cell;
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addrowpress:(id)sender {
}

- (IBAction)insertSectionPressed:(id)sender {
   
    
    
}

- (IBAction)addrowPressed:(id)sender {
    
    [self RefreshPropts];
}

- (IBAction)addsectionpress:(id)sender {
    
    [self AddPropt];
    
    
    
    
    
}
@end
