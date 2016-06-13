//
//  LoginViewController.m
//  VauntBroadcaster
//
//  Created by Master on 7/14/15.
//  Copyright (c) 2015 Vaunt. All rights reserved.
//

#import "LoginViewController.h"
#import "utils.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set TextField layout and placeholder color
    for (int i = 0; i < 2; i++) {
        UITextField *textField;
        if (i == 0)
            textField = self.txtFEmail;
        else if (i == 1)
            textField = self.txtFPassword;
        
        UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 24, 20)];
        textField.leftView = paddingView;
        textField.leftViewMode = UITextFieldViewModeAlways;
        
        [textField setValue:[UIColor colorWithRed:154/255.0 green:154/255.0 blue:154/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onbtnLoginClicked:(id)sender {
    NSString *email = [self.txtFEmail.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = self.txtFPassword.text;
    
    if ([email isEqualToString:@""] || ![Utils validateEmail:email]) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Please enter valid email address." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
    if ([password isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Please enter password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
    if (password.length < 8) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Password must be at least 8 characters long." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:email forKey:@"email"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self performSegueWithIdentifier:@"segueCameraFromLogin" sender:nil];
}

- (IBAction)onbtnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
