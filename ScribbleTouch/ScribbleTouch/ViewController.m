//
//  ViewController.m
//  ScribbleTouch
//
//  Created by Ebony Nyenya on 1/14/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "ViewController.h"
#import "ScribbleView.h"

@interface ViewController ()

@end

@implementation ViewController

{
    NSMutableDictionary * currentScribble;
    
    UIColor * selectedColor;
    
    int selectedStrokeWidth;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    selectedColor = [UIColor blackColor];
}


- (IBAction)changeColor:(UIButton *)sender {
    selectedColor = sender.backgroundColor;
}

- (IBAction)changeStrokeWidth:(UISlider *)sender {
    
    selectedStrokeWidth = sender.value;
}

//***This code refreshed the view (with the buttons and slider still present after refreshing) when the 'start over' button is tapped***
- (IBAction)startOverButton:(UIButton *)sender {
    
    UIView *parent = self.view.superview;
    
    [self.view removeFromSuperview];
    
    self.view = nil; // unloads the view
    
    [parent addSubview:self.view];
   
    
}
    
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * touch = touches.allObjects.firstObject; //this gets the first touch inside the NSSet
    
    CGPoint location = [touch locationInView:self.view];
    
    NSLog(@"x %f y %f", location.x, location.y);
    
    currentScribble = [@{
                         
                         @"type":@"path",
                         @"fillColor": [UIColor clearColor],
                         @"strokeColor": selectedColor,
                         @"strokeWidth":@(selectedStrokeWidth),
                         @"points": [@[[NSValue valueWithCGPoint:location]] mutableCopy] //C types can't go directly in an array
                         
                         
                         } mutableCopy];
    
   ScribbleView * sView = (ScribbleView *)self.view;
   [sView.scribbles addObject:currentScribble]; //sView.scribbles is a getter that runs the array from ScribbleView.m; you can do these two lines of code or the one line of code below
    
//    [((ScribbleView *)self.view).scribbles addObject:currentScribble];
    
}



- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    [currentScribble[@"points"] addObject:[NSValue valueWithCGPoint:location]];
    
    [self.view setNeedsDisplay];
    
}

@end
