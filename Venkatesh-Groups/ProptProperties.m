//
//  ProptProperties.m
//  RenaldTabHomework5
//
//  Created by  on 10/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProptProperties.h"

@implementation ProptProperties

@synthesize Id;
@synthesize text;
@synthesize owner;
@synthesize choices;
@synthesize correctAnswer;
@synthesize timer;
@synthesize dataTime;


- (void) setProperties: (NSInteger) aId andOwner:(NSString *)aOwner andText:(NSString *) atext  andChoices:(NSMutableDictionary *)aChoices andCorrectAnswer:(NSString * )aCorrect andSelectedAnswer: (NSString *)aSelectedAnswer
{
    Id = aId;
    owner = aOwner;
    text = atext;
    choices = aChoices;
    correctAnswer = aCorrect;
    selectedAnswer = aSelectedAnswer;
  
}


@end
