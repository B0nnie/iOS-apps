//
//  Person.h
//  PeopleDatabase
//
//  Created by Ebony Nyenya on 1/11/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    
NSString *firstName;
NSString *lastName;
int age;
    
}

-(void) enterInfo;
-(void) printInfo;
@end
