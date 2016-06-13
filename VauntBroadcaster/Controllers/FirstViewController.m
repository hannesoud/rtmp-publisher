//
//  LoginViewController.m
//
//  Copyright (c) 2015 Vaunt. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLoginClicked:(id)sender {
    [self performSegueWithIdentifier:@"segueLogin" sender:nil];
}

- (IBAction)onSignupClicked:(id)sender {
    [self performSegueWithIdentifier:@"segueRegister" sender:nil];
}

@end
