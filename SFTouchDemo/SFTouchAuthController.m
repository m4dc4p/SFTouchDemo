//
//  SFTouchAuthController.m
//  SFTouchDemo
//
//  Created by Justin Bailey on 3/19/13.
//  Copyright (c) 2013 Justin Bailey. All rights reserved.
//

#import "SFTouchAuthController.h"
#import "SFTouchAppDelegate.h"

@interface SFTouchAuthController ()

@property (strong, nonatomic) SFOAuthCoordinator * coordinator;
@property (strong, nonatomic) SFOAuthCredentials * credentials;

@end

static NSString *const CredID = @"TouchDemo";
static NSString *const RemoteAccessConsumerKey = @"3MVG9A2kN3Bn17humtOtYKkuZcp50xL7T1BpkKLDp4J1qPJR4FpGHvpVZo6EtnSd18sU4ARpmzwgJkFddjciw";
static NSString *const OAuthRedirectURI = @"sfdc://success";

@implementation SFTouchAuthController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.credentials = [[SFOAuthCredentials alloc] initWithIdentifier:CredID clientId:RemoteAccessConsumerKey encrypted:NO];
    self.credentials.redirectUri = OAuthRedirectURI;

    self.coordinator = [[SFOAuthCoordinator alloc] initWithCredentials:self.credentials];
    self.coordinator.delegate = self;
    self.coordinator.scopes = [NSSet setWithArray:@[@"web",@"api"]];
    
    if(self.credentials.refreshToken || self.credentials.accessToken) {
        [self.credentials revoke];
    }

    [self.coordinator authenticate];

}

- (void)oauthCoordinator:(SFOAuthCoordinator *)coordinator didBeginAuthenticationWithView:(UIWebView *)view
{
}

- (void)oauthCoordinator:(SFOAuthCoordinator *)coordinator willBeginAuthenticationWithView:(UIWebView *)view
{
    self.view = view;
}

- (void)oauthCoordinatorDidAuthenticate:(SFOAuthCoordinator *)coordinator authInfo:(SFOAuthInfo *)info
{
}

- (void)oauthCoordinator:(SFOAuthCoordinator *)coordinator didFailWithError:(NSError *)error authInfo:(SFOAuthInfo *)info
{
    [SFTouchAppDelegate sharedInstance].cred = info;
}

@end
