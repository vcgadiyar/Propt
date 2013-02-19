//
//  Database.m
//  first
//
//  Created by Propt Development on 2/2/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import "Database.h"
#import "ViewController.h"


@implementation Database
//@synthesize inputText;
@synthesize postConnection;


-(void) postMessage:(NSString *)myString
{
    
    NSMutableString *postString = [NSMutableString stringWithString:kPostUrl];
    //NSString *postString = [NSMutableString stringWithString:kPostUrl];
    NSString *phoneNumber = myString;
    
    [postString appendString:[NSString stringWithFormat:@"?%@=%@", kFunctionName, @"addUserToDatabase"]];
    [postString appendString:[NSString stringWithFormat:@"&%@=%@", kOnePhoneNumber, phoneNumber]];
    
    //[postString appendString:[NSString stringWithFormat:@"&%@=%@", kyPoint, [data objectAtIndex:1]]];
    
    
    
    [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
    
    [request setHTTPMethod:@"POST"];
    
    
    postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
    
}

-(void) getMessage
{
    
    [NSThread detachNewThreadSelector:@selector(getMessageOnThread) toTarget:self withObject:nil];
    
    
}

-(void)getMessageOnThread
{
    NSMutableString *getString = [NSMutableString stringWithString:kPostUrl];
    
    [getString appendString:[NSString stringWithFormat:@"?%@=%@", kFunctionName, @"getAllGroups"]];
    
    
    
    [getString setString:[getString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSURL *url = [NSURL URLWithString:getString];
    
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    [self performSelectorOnMainThread:@selector(printData:) withObject:data waitUntilDone:YES];
}

-(void) printData: (NSData *)data
{
    //PRint Data
    
    json = [[NSDictionary alloc] init];
    
    NSError *error;
    
    if([data length] > 0)
    {
        json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSLog(@"Parsed Data : %@", json);
        
        for (NSDictionary *d in json)
        {
            //NSString *groupName = [json valueForKey:@"ID                     "];
            
            
        }
    }
    NSArray *array;
    array = [[NSArray alloc]initWithObjects:@"Venka Bhosdi Wala", @"ABCD",@"EFGH", nil];
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"TestNotification"
     object:array];
    
    
}


@end