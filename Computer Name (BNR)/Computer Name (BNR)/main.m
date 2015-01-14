//
//  main.m
//  Computer Name (BNR)
//
//  Created by Ebony Nyenya on 1/12/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSHost *host = [NSHost currentHost];
//        NSString *computerName = [host localizedName];
//        NSLog(@"The name of your computer is %@", computerName); or
        
        NSLog(@"The name of your computer is %@", [[NSHost currentHost] localizedName]);
    }
    return 0;
}
