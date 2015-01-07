//
//  Human.h
//  Human
//
//  Created by Ebony Nyenya on 1/6/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import <UIKit/UIKit.h>

// Create a Body Class and add it as a property to Human
// Create Leg, Head Classes and add them and Arm as properties on the /Body
// Add 10 additional classes for other parts

// Create 2 methods on each class (EX: Mouth will have  - (void)chewFood: (id)food;)

// Add 2 properties per class that define the part (not including properties like finger)

@class Body;

@interface Human : NSObject

@property (nonatomic) Body * myBody;

@end
