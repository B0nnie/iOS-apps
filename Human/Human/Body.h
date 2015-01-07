//
//  Body.h
//  Human
//
//  Created by Ebony Nyenya on 1/6/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "Human.h"

@class Leg;
@class Head;
@class Arm;
@class Stomach;
@class Neck;
@class Liver;
@class Kidney;

@interface Body : NSObject

@property (nonatomic) Leg * leftLeg;
@property (nonatomic) Leg * rightLeg;

@end
