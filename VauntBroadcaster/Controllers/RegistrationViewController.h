//
//  RegistrationViewController.h
//
//  Copyright (c) 2015 Vaunt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtFFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtFLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtFEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtFPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtFConfirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtFZipCode;

@end
