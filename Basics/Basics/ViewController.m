//
//  ViewController.m
//  Basics
//
//  Created by Ebony Nyenya on 1/5/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "ViewController.h"

//  Create 2 View Controllers on the main storyboard

// View Controller 1
// - 2 buttons (one will clear textfields, one will log all textfields)
// - 3 textfields (username, email, password)
// - password field should look like one by hiding the text with dots (look in the right panel)
// - email field should use email keyboard (also in right panel)

// View Controller 2
// - 4 buttons with different color backgrounds (one method for all 4 buttons)
// - each button changes the main view controller's background color

// Add constraints
// Make the buttons on view controller 2 circles with no text

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

- (IBAction)username:(UITextField *)sender {
}
- (IBAction)clear:(UIButton *)sender {
    
    self.username.text = @"";
    self.email.text = @"";
    self.password.text = @"";

}



- (IBAction)log:(UIButton *)sender {
    
    NSString * username = self.username.text;
    
    NSLog(@"Username is %@", username);
    
    
    NSString * email = self.email.text;
    
    NSLog(@"Email is %@", email);
    
    
    NSString * password = self.password.text;
    
    NSLog(@"Username is %@", password);

    
}



@end
