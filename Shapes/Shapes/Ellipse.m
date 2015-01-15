//
//  Ellipse.m
//  Shapes
//
//  Created by Ebony Nyenya on 1/14/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "Ellipse.h"
IB_DESIGNABLE //this renders all the drawrect code on the storyboard so you can see the ellipse shape on storyboard

@implementation Ellipse


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 
- (void)drawRect:(CGRect)rect {
      // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext(); //this is a C type variable and C type function; notice empty parentheses and no * before variable
    
    //[[UIColor greenColor] set]; or code below plus the IB_Inspectable code on Ellipse.h
    
    [self.fillColor set];
    
    CGContextFillEllipseInRect(context, rect); //this is a C function with C parameters
    
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    CGFloat xCP = w/4;
    CGFloat yCP = h/4;
    
    CGContextMoveToPoint(context, w/2, 0);
    
    CGContextAddCurveToPoint(context, w - xCP, 0, w, yCP, w, h/2);
    CGContextAddCurveToPoint(context, w, h - yCP, w - xCP, h, w/2, h);
    CGContextAddCurveToPoint(context, xCP, h, 0, h - yCP, 0, h/2);
    CGContextAddCurveToPoint(context, 0, yCP, xCP, 0, w/2, 0);
    
    CGContextFillPath(context);

  
}


@end
