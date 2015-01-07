//
//  ViewController.h
//  Basics
//
//  Created by Ebony Nyenya on 1/5/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *email;


@property (weak, nonatomic) IBOutlet UITextField *password;


- (IBAction)clear:(UIButton *)sender;

- (IBAction)log:(UIButton *)sender;



@end

