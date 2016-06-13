//
//  RegistrationViewController.m
//
//  Copyright (c) 2015 Vaunt. All rights reserved.
//

#import "RegistrationViewController.h"
#import "Utils.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
    // Set TextField layout and placeholder color
    for (int i = 0; i < 6; i++) {
        UITextField *textField;
        if (i == 0)
            textField = self.txtFFirstName;
        else if (i == 1)
            textField = self.txtFLastName;
        else if (i == 2)
            textField = self.txtFEmail;
        else if (i == 3)
            textField = self.txtFPassword;
        else if (i == 4)
            textField = self.txtFConfirmPassword;
        else if (i == 5)
            textField = self.txtFZipCode;
        
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

- (IBAction)onbtnRegisterClicked:(id)sender {
    NSString *firstName = [self.txtFFirstName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *lastName = [self.txtFLastName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *email = [self.txtFEmail.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = self.txtFPassword.text;
    NSString *confirmPassword = self.txtFConfirmPassword.text;
    NSString *zipCode = [self.txtFZipCode.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([firstName isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Please enter first name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
    if ([lastName isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Please enter last name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
    if ([email isEqualToString:@""] || ![Utils validateEmail:email]) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Please enter valid email address." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
    if ([password isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Please enter password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
    if (password.length < 8 || confirmPassword.length < 8) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Passwords must be at least 8 characters long." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    if (![password isEqualToString:confirmPassword]) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Passwords do not match." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
    if ([zipCode isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Please enter zip code." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:email forKey:@"email"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self performSegueWithIdentifier:@"segueCameraFromRegister" sender:nil];
}

- (IBAction)onbtnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}



#pragma mark - TextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
