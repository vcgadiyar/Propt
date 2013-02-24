//
//  ProptProperties.h
//  RenaldTabHomework5
//
//  Created by  on 10/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProptProperties : NSObject
{
    NSInteger Id;
    NSString *text;
    NSString *owner;
    NSMutableDictionary *choices;
    NSString *selectedAnswer;
    NSString *correctAnswer;
    NSString *timer;
    NSString *dataTime;
    NSInteger votes;

}

@property NSInteger Id;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *owner;
@property (nonatomic, retain) NSString *correctAnswer;
@property (nonatomic, retain) NSString *selectedAnswer;
@property (nonatomic, retain) NSString *timer;
@property (nonatomic, retain) NSString *dataTime;
@property NSInteger votes;
@property (nonatomic, retain) NSMutableDictionary *choices;


- (void) setProperties: (NSInteger) aId andOwner:(NSString *)aOwner andText:(NSString *) atext  andChoices:(NSMutableDictionary *)aChoices andCorrectAnswer:(NSString * )aCorrect andSelectedAnswer: (NSString *)aSelectedAnswer;


@end
