//
//  Database.h
//  first
//
//  Created by Propt Development on 2/2/13.
//  Copyright (c) 2013 Propt Development. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kPostUrl @"http://www.courseeker.com/Propt/Scripts/Propt_Scripts.php"
#define kGetUrl @"http://www.courseeker.com/Propt/Scripts/vignesh/getNumber_test.php"
#define vUrl @"http://www.courseeker.com/Propt/Scripts/vignesh/Users.php"


#define kOnePhoneNumber @"phoneNumber"
#define kFunctionName @"function"

@interface Database : NSObject
{
    NSDictionary *json;
}

- (void) postMessage:(NSString *)myString;
- (void) getMessage;


@property (strong, nonatomic) NSURLConnection *postConnection;

@end
