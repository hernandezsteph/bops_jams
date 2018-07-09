//
//  LoginController.m
//  FinalProject
//
//  Created by Stephanie  Hernandez hern108@usc.edu.
//  Copyright © 2018 Stephanie  Hernandez. All rights reserved.
//

#import "LoginController.h"
#import "AppDelegate.h"


@interface LoginController ()
@property (weak, nonatomic) IBOutlet UIButton *SpotifyLogIn;
@property (strong, nonatomic) AppDelegate *appDelegate;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Login:(id)sender {
    [self.appDelegate startAuthenticationFlow: self];
}

- (void)sendView{
    [self performSegueWithIdentifier:@"ShowEvents" sender:self];
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
