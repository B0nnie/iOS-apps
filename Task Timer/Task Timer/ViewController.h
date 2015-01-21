//
//  ViewController.h
//  Task Timer
//
//  Created by Ebony Nyenya on 1/19/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *firstTask;

@property (strong, nonatomic) IBOutlet UIPickerView *firstTaskTime;

@property (strong, nonatomic) IBOutlet UIButton *startTasksButton;

@end

