//
//  ViewController.h
//  First App
//
//  Created by Ebony Nyenya on 1/5/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) IBOutlet UILabel * myLabel;

@property (weak, nonatomic) IBOutlet UITextField *myTextField;



- (IBAction)bigButtonPressed:(id)sender;


@end

