//
//  QuoteBank.m
//  Inspiration
//
//  Created by Ebony Nyenya on 1/23/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "QuoteBank.h"

@implementation QuoteBank

-(instancetype)init {
    
    self = [super init];
    if(self)  {
    
    _quotes = [[NSArray alloc] initWithObjects: @"Everything will be                       okay.",
                        @"You are beautiful, both inside and out.",
                        @"Tough times don't last, but tough people do.  And you are tough!",
                        @"Your efforts are not wasted; all efforts are cumulative.",
                        nil];
        
    }
    return self;
}

-(NSString *) randomQuotes {
    
    int random = arc4random_uniform((int) self.quotes.count);
    
    return [self.quotes objectAtIndex:random];
}

@end
