//
//  ViewController.h
//  Inspiration
//
//  Created by Ebony Nyenya on 1/23/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuoteBank.h"

@class QuoteBank;
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;
@property (strong, nonatomic) QuoteBank *quoteBank;

@end

