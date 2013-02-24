//
//  MyPlayerCoordinates.h
//  RenaldTabHomework5
//
//  Created by  on 10/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyPlayerCoordinates : NSObject
{
NSString *Id;
NSString *name;
float x;
float y;
CGPoint startPoint;
}

@property (nonatomic, retain) NSString *Id;
@property (nonatomic, retain) NSString *name;
@property float x;
@property float y;
@property CGPoint startPoint;

- (void) setCoordinates: (NSString *) aID andName:(NSString *)aName andX:(float )aX andY:(float )aY;


@end
