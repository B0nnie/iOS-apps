//
//  PrettyButton.m
//  First App
//
//  Created by Ebony Nyenya on 1/5/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "PrettyButton.h"

@implementation PrettyButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 
- (void) drawRect:(CGRect)rect {
    // Drawing code
 
    self.layer.cornerRadius = self.cornerSize;
    self.layer.masksToBounds = YES;
    
}


@end
