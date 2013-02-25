//
//  Person.h
//  Propt-Beta
//
//  Created by Propt Development on 2/23/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Person : UIViewController{
    
}
@property (nonatomic, strong) NSString *firstName;

@property (nonatomic, strong) NSString *lastName;

@property (nonatomic, strong) NSString *fullName;

@property (nonatomic, strong) NSString *homeEmail;
@property (nonatomic, strong) NSString *phoneNo;
@property (nonatomic, strong) NSString *ID;

@property (nonatomic, strong) NSString *workEmail;


@end
