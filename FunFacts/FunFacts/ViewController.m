//
//  ViewController.m
//  FunFacts
//
//  Created by Ebony Nyenya on 1/22/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showFunFact {
    
    NSArray * facts = [[NSArray alloc] initWithObjects:@"Ants stretch when they wake up.", @"Ostriches can run faster than horses.",    nil];
    
    self.funFactLabel.text = [facts objectAtIndex:1];
}

@end
