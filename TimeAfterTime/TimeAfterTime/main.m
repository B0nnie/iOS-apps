//
//  main.m
//  TimeAfterTime
//
//  Created by Ebony Nyenya on 1/11/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
     NSDate *now = [NSDate date];
        
        NSLog(@"The date is %@", now);
        //The above 2 lines of code have the same output as NSLog(@"The date is %@", [NSDate date]);
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970.", seconds);

    }
    return 0;
}
