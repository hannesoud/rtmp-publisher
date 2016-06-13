//
//  ViewController.m
//
//  Copyright (c) 2015 Vaunt. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *fontFamilies = [UIFont familyNames];
    
    for (int i = 0; i < [fontFamilies count]; i++)
    {
        NSString *fontFamily = [fontFamilies objectAtIndex:i];
        NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
        NSLog (@"%@: %@", fontFamily, fontNames);
    }
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.indicatorView.center = CGPointMake(self.view.center.x, self.view.center.y + 150.0);
    [self.indicatorView startAnimating];
    [self.view addSubview:self.indicatorView];
    
    [self performSelector:@selector(goToNextScreen) withObject:nil afterDelay:3.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goToNextScreen {
   // NSString *registeredEmail = [[NSUserDefaults standardUserDefaults] objectForKey:@"RegisteredEmail"];
    //if (registeredEmail == nil || [registeredEmail isEqualToString:@""])
        [self performSegueWithIdentifier:@"segueLogin" sender:nil];
    /* else {
        ChannelSelectionViewController *channelVC = (ChannelSelectionViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ChannelSelectio nVC"];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:channelVC];
        navController.navigationBar.barTintColor = [UIColor whiteColor];
        navController.navigationBar.translucent = NO;
        [self presentViewController:navController animated:YES completion:nil];
    } */
}

@end
