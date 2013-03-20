//
//  SFTouchAuthController.m
//  SFTouchDemo
//
//  Created by Justin Bailey on 3/19/13.
//  Copyright (c) 2013 Justin Bailey. All rights reserved.
//

#import "SFTouchAuthController.h"
#import "SFTouchAppDelegate.h"
#import "SFOAuthInfo.h"

@interface SFTouchAuthController ()

@property (strong, nonatomic) SFOAuthCoordinator * coordinator;

@end

@implementation SFTouchAuthController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    SFOAuthCredentials * credentials = [[SFOAuthCredentials alloc]
                                        initWithIdentifier:StoredCredentialKey
                                        clientId:RemoteAccessConsumerKey
                                        encrypted:NO];
    credentials.redirectUri = OAuthRedirectURI;
    if(credentials.refreshToken || credentials.accessToken) {
        [credentials revoke];
    }

    self.coordinator = [[SFOAuthCoordinator alloc]
                        initWithCredentials:credentials];
    self.coordinator.delegate = self;
    [self.coordinator authenticate];

}

- (void)oauthCoordinator:(SFOAuthCoordinator *)coordinator willBeginAuthenticationWithView:(UIWebView *)view
{
    self.view = view;
}

- (void)oauthCoordinatorDidAuthenticate:(SFOAuthCoordinator *)coordinator authInfo:(SFOAuthInfo *)info
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)oauthCoordinator:(SFOAuthCoordinator *)coordinator didFailWithError:(NSError *)error authInfo:(SFOAuthInfo *)info
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)oauthCoordinator:(SFOAuthCoordinator *)coordinator didBeginAuthenticationWithView:(UIWebView *)view
{
}
@end
