//
//  MyView.m
//  Speaking
//
//  Created by Ebony Nyenya on 1/13/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "MyView.h"

@implementation MyView

-(void)setName:(NSString *)name {
    
    if (![name isEqualToString:@"BOSS"]) {
        
        [self.delegate changeMyNameTo:@"BOSS"];
        return;
        
    }
    
    _name = name;
    
}

@end
