//
//  ScribbleView.m
//  ScribbleTouch
//
//  Created by Ebony Nyenya on 1/14/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "ScribbleView.h"

@implementation ScribbleView

//    @[
//
//        @{
//        @"type":@"path",
//        @"fillColor": [UIColor greenColor],
//        @"strokeColor": [UIColor blackColor],
//        @"strokeWidth":@2,
//        @"points":@[point, point, point]
//        },
//
//        @{
//        @"type":@"circle",
//        @"fillColor": [UIColor greenColor],
//        @"strokeColor": [UIColor blackColor],
//        @"strokeWidth":@2,
//        @"frame":CGRect
//        }
//
//    ];

- (NSMutableArray *) scribbles {
    
    if (_scribbles == nil) { _scribbles = [@[] mutableCopy];}
    
    return _scribbles;
    
    }
    


//
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    
     //Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //these two lines of code change round out the scribble brush's shape
    CGContextSetLineJoin (context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    
    
    for (NSDictionary * scribble in self.scribbles) {
        
        CGContextSetLineWidth(context, [scribble[@"strokeWidth"] floatValue]); //width of stroke
        
        UIColor * strokeColor = scribble[@"strokeColor"];
        [strokeColor set]; //color of stroke
        
        
        CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
        
        for (NSValue * pointValue in scribble[@"points"]) {
            
            CGPoint point = [pointValue CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
        
        }
        
        CGContextStrokePath(context);
        
    }
    
}


@end
