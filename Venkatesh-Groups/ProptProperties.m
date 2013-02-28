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
@synthesize FirstRun;

@synthesize groupId;
@synthesize posterId;
@synthesize startTime;
@synthesize endTime;





- (void) setProperties: (NSInteger) aId andGroupID: (NSInteger)agroupId andPosterID: (NSInteger) aposterId andStartTime:(NSString *)astartTime andEndTime:(NSString *)aendTime  andOwner:(NSString *)aOwner andText:(NSString *) atext  andChoices:(NSMutableDictionary *)aChoices andCorrectAnswer:(NSString * )aCorrect andSelectedAnswer: (NSString *)aSelectedAnswer;
{
    Id = aId;
    owner = aOwner;
    text = atext;
    choices = aChoices;
    correctAnswer = aCorrect;
    selectedAnswer = aSelectedAnswer;
    
    groupId = agroupId;
    posterId = aposterId;
    startTime = astartTime;
    endTime = aendTime;
    Imported = NO;

}


@end
