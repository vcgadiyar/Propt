//
//  ViewController.m
//  Propt-Beta
//
//  Created by Propt Development on 2/21/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import "ViewController.h"
#import "Database.h"
#import "GroupsGames.h"

//Player's name
NSString *pname;
int pno;
extern int screen;

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad
{
    screen = 0;
    [super viewDidLoad];
    int timestamp;
    timestamp=[[NSDate date] timeIntervalSince1970];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSLog(@"%@", date);
    
    //self.name.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    self->offset = self.view.center;
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)keyboardDidShow:(NSNotification *)note
{
    if (screen == 0) {
        self.view.center = CGPointMake(self->offset.x, 60);
    }
    
    /* move your views here */
}

- (void)keyboardDidHide:(NSNotification *)note
{
    if (screen == 0) {
        self.view.center = self->offset;
    }
    
    /* move your views here */
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)PostMyNumber
{
    Database * sendToDB = [[Database alloc] init];
    //NSString *myString = number.text;
    [sendToDB postMessage:pname withno:pno];
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == self->name) {
		[self->name resignFirstResponder];
		[self->number becomeFirstResponder];
	}
	else if (textField == self->number) {
		[self->number resignFirstResponder];
    }
    return YES;
}

- (IBAction)switchView:(id)sender{

    myViewController = [[GroupsGames alloc]initWithNibName:@"GroupsGames" bundle:nil];
    
    [self presentViewController:myViewController animated:YES completion:nil];
    //[navigationController pushViewController:myViewController]
}

- (IBAction)onClick:(id)sender {
    pname= name.text;
    pno=[number.text intValue];
    [self PostMyNumber];
    [name resignFirstResponder];
    [number resignFirstResponder];
    
}
@end
