//
//  Person.m
//  PeopleDatabase
//
//  Created by Ebony Nyenya on 1/11/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)enterInfo {
    NSLog(@"What is the first name?");
    char cstring[40];
    scanf("%s", cstring);
    firstName = [NSString stringWithCString:cstring encoding:1];
    
    NSLog(@"What is %@'s last name?", firstName);
    scanf("%s", cstring);
    lastName = [NSString stringWithCString:cstring encoding:1];
    
    NSLog(@"How old is %@ %@?", firstName, lastName);
    scanf("%i", &age);
}

-(void)printInfo {
    NSLog(@"%@ %@ is %i years old",firstName, lastName, age);
}
@end
