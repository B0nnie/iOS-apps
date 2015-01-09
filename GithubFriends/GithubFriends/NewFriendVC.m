//
//  NewFriendVC.m
//  GithubFriends
//
//  Created by Ebony Nyenya on 1/8/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "NewFriendVC.h"

@interface NewFriendVC ()

@end

@implementation NewFriendVC
{
    UITextField * usernameField; //this is a local instance variable, so it's now accessible in any method in implementation
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    usernameField = [[UITextField alloc] initWithFrame: CGRectMake(10,60,300,40)];
    usernameField.placeholder = @"Username";
    [self.view addSubview:usernameField];
    
    
    UIButton * saveFriend = [[UIButton alloc] initWithFrame:CGRectMake( 10, 110, 300, 40)];
    [saveFriend setTitle:@"Git User" forState:UIControlStateNormal];
    [saveFriend addTarget:self action:@selector (save) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:saveFriend];
    
    //cancel button
    UIButton * cancel = [[UIButton alloc] initWithFrame: CGRectMake(10, 160, 300, 40)];
    [cancel setTitle:@"Cancel" forState: UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: cancel];
                                                                                 
                                                                                
}

-(void)save {
    NSString * username = usernameField.text; //this gets the text from the user field
    
    NSString * urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@",username]; //format specifier passing thru string; this string will be different with each diff username that is entered
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];//this is not mutable
    
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil]; //class method, this is going to return a chunk of data, will send a request to the url, it will come back as JSON text
    
    NSDictionary * userInfo = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error:nil];
    
    [self.friends addObject:userInfo];
    
    [self cancel];
                             
}

- (void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}
     
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
