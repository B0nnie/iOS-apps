//
//  QuoteBank.h
//  Inspiration
//
//  Created by Ebony Nyenya on 1/23/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuoteBank : NSObject

@property (strong, nonatomic) NSArray *quotes;

-(NSString *) randomQuotes;

@end
