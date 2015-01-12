//
//  ViewController.m
//  TicTacToe
//
//  Created by Ebony Nyenya on 1/12/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

// Homework 1/12/15:
// 1) Center squares on view - done

// 2) Score labels on top that keep track of wins for each player (need 2 global instance variables that keep track of each player's score) - done

// 3) Make buttons change colors instead of title (reset colors when play again is tapped) - will change one color for player 1 and another color for player 2 - done

// 4) Button at bottom that resets game scores - done

// Extra: Alert view for draw (hint: "arraycontains", if it doesn't contain a 0 - if there are no 0s left)

@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController

//these things need to go across the whole board
{
    int playerTurn;
    
    UILabel * playerScore1; //hw pt 2

    UILabel * playerScore2; //hw pt 2
    
    NSMutableArray * squares;
    
    NSMutableArray * buttons;
    
    int player1points; // hw  pt 2
    int player2points;// hw pt 2
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    buttons = [@[] mutableCopy];
    
    playerTurn = 1;
    squares = [@[
                 @0, @0, @0,
                 @0, @0, @0,
                 @0, @0, @0
                 
                 ] mutableCopy]; //at end of game, this needs to be reset
    
    
    int rowCount = 3;
    int colCount = 3;
    CGFloat width = 100;
    CGFloat height = 100;
    
    int buttonCount = 0;
    
    
    
    
    //this is adding player labels at the top, hw pt 2
     player1points = 0;
     player2points = 0;
    
  
    playerScore1 = [[UILabel alloc] initWithFrame:(CGRectMake(10, 40, 100, 30))];
    playerScore1.backgroundColor = [UIColor blueColor];
    playerScore1.text = [NSString stringWithFormat:@"Player 1:%d",player1points];
  
    playerScore2 = [[UILabel alloc] initWithFrame:(CGRectMake(200, 40, 100, 30))];
    playerScore2.backgroundColor = [UIColor blueColor];
    playerScore2.text = [NSString stringWithFormat:@"Player 2:%d",player1points];
    
    [self.view addSubview:playerScore1];
    [self.view addSubview:playerScore2];
    
    
    
    //this is creating the rows and columns of the game
    for (int r = 0; r < rowCount; r++) {
        //loop per row
     
    
        for (int c = 0; c < colCount; c++) {
            
            //loop per column, we'll do all our code here for x row count and y column count
            
            CGFloat x = c * (width + 10) + (SCREEN_WIDTH - 320)/2;
            CGFloat y = r * (height + 10) + (SCREEN_HEIGHT - 320)/2;//this centers the squares on the screen (HW pt1)
            
            UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(x,y,width, height)];
            
            button.backgroundColor = [UIColor blueColor];
            
            //[button setTitle:[NSString stringWithFormat: @"%d", buttonCount] forState: UIControlStateNormal];// jo what does forState and UIControl... mean?
            
            button.tag = buttonCount;
            
            //this is having the button listen for touches
            [button addTarget: self action:@selector (squareTapped:) forControlEvents:UIControlEventTouchUpInside]; // jo what's the difference between this method and the (void) squaretapped method below? custom method?
            
            //adds button to the view (also adds to an array of subviews)
            [self.view addSubview:button];
            [buttons addObject:button];
            
            buttonCount++;
        }
        
        //HW pt 4 - part of creating the clear button
        UIButton * clear = [[UIButton alloc] initWithFrame:CGRectMake(150, 550, 100, 100)];
        
        clear.backgroundColor = [UIColor blueColor];
        [clear setTitle:@"Clear" forState:UIControlStateNormal];
        
        [clear addTarget: self action:@selector (clearTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:clear];
    
    }
    
    NSLog(@"subviews %@", self.view.subviews);
}

//this is when the clear button is tapped and resets the players' scores to 0 on the player labels HW pt 4
-(void) clearTapped: (UIButton *) clear {
    
    playerScore1.text = [NSString stringWithFormat:@"Player 1:%d",player1points = 0];

    playerScore2.text = [NSString stringWithFormat:@"Player 2:%d",player2points = 0];

}


//this is what happens when a game square is tapped
- (void) squareTapped: (UIButton *) button {
    
    if ([squares[button.tag] intValue] != 0) {return; }
    
    squares[button.tag] = @(playerTurn); //playerTurn is an int turned into a literal //@(playerTurn); is the shorthand version of [NSNumber numberWithInt:playerTurn];
    
    
    //HW pt 3
    if(playerTurn == 1) { button.backgroundColor = [UIColor purpleColor]; }
        
    else { button.backgroundColor = [UIColor redColor];
    }
    
    //[button setTitle:[NSString stringWithFormat: @"%d", playerTurn] forState:UIControlStateNormal]; - this was assoc. with line 175
    
    //this is a conditional variable
    playerTurn = (playerTurn ==2) ? 1 : 2;
    
    //NSLog(@"button tapped %d", (int)button.tag);
    
    [self checkForWin];

}

//this checks to see if someone won

-(void) checkForWin {
    //8 winning possibilities
    NSArray * possibilities = @[
                                //rows
                                 @[@0, @1, @2],
                                 @[@3, @4, @5],
                                 @[@6, @7, @8],
                                //columns
                                 @[@0, @3, @6],
                                 @[@1, @4, @7],
                                 @[@2, @5, @8],
                                 //diagonals
                                 @[@0, @4, @8],
                                 @[@2, @4, @6]
                                ]; //notice mutableCopy isn't here
    
    for (NSArray * possibility in possibilities) {
        
        [self checkPossibility: possibility withPlayer: 1];
        [self checkPossibility: possibility withPlayer: 2];
        
        }
    
}

//this keeps track of who won
- (void)checkPossibility:(NSArray *) possibility withPlayer: (int) player {
    
    BOOL playerInSquare1 = ([squares [[possibility[0] intValue]] intValue] == player);
    BOOL playerInSquare2 = ([squares [[possibility[1] intValue]] intValue] == player);
    BOOL playerInSquare3 = ([squares [[possibility[2] intValue]] intValue] == player);
    
    if (playerInSquare1 && playerInSquare2 && playerInSquare3) {
        
        //player 1 won
        
        NSLog(@"Player %d Won", player);
        
        NSString * message = [NSString stringWithFormat:@"Player %d Won", player];
      
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Winner" message: message delegate:self cancelButtonTitle:@"Play Again!" otherButtonTitles:nil];
        [alertView show];
        
        //this is incrementing the score each time a player wins and displaying it on the player's label
        if (player == 1) {
            player1points++;
            playerScore1.text = [NSString stringWithFormat:@"Player 1:%d",player1points];
        } else if (player == 2) {
            player2points++;
            playerScore2.text = [NSString stringWithFormat:@"Player 2:%d",player2points];
            
        } //another else statement for a draw would go here
      
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // resetting square titles (this resets the game)
    // playerTurn = 1
    
    for (UIButton * button in buttons) {
        
        //[button setTitle: @"" forState:UIControlStateNormal];
        
        
        //HW pt 3
        button.backgroundColor = [UIColor blueColor];
    }
    
    playerTurn = 1;
    
    
    squares = [@[
                 @0, @0, @0,
                 @0, @0, @0,
                 @0, @0, @0
                 
                 ] mutableCopy];

    
    NSLog(@"Play again!");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
