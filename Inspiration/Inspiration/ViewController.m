//
//  ViewController.m
//  Inspiration
//
//  Created by Ebony Nyenya on 1/23/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.quoteBank = [[QuoteBank alloc] init];
    
    self.quoteLabel.text = [self.quoteBank randomQuotes];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeQuoteButton {
    
    self.quoteLabel.text = [self.quoteBank randomQuotes];
    
    
}

@end
