//
//  SFTouchViewController.m
//  SFTouchDemo
//
//  Created by Justin Bailey on 3/19/13.
//  Copyright (c) 2013 Justin Bailey. All rights reserved.
//

#import "SFTouchViewController.h"
#import "SFTouchAppDelegate.h"

@interface SFTouchViewController ()
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

@end

@implementation SFTouchViewController

- (void)viewWillAppear:(BOOL)animated {
    BOOL loggedIn = [SFTouchAppDelegate sharedInstance].cred != nil;

    self.loginButton.hidden = !loggedIn;
    self.logoutButton.hidden = loggedIn;
}

- (IBAction)doLogin:(id)sender {
    self.loginButton.hidden = YES;
    self.logoutButton.hidden = NO;
}

- (IBAction)doLogout:(id)sender {
    self.loginButton.hidden = NO;
    self.logoutButton.hidden = YES;
}

@end
