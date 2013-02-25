//
//  AppDelegate.h
//  Propt-Beta
//
//  Created by Propt Development on 2/21/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSMutableArray *sname;
     NSMutableArray *personsArray;
    NSMutableArray *selectedNumbers;
    NSLock*     mutex;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property(nonatomic, retain)NSMutableArray *sname;
@property(nonatomic, retain)NSMutableArray *personsArray;
@property(nonatomic, retain)NSMutableArray *selectedNumbers;
@property(nonatomic, retain)NSLock *mutex;
@end
