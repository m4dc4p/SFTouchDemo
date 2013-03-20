//
//  SFTouchAppDelegate.h
//  SFTouchDemo
//
//  Created by Justin Bailey on 3/19/13.
//  Copyright (c) 2013 Justin Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFOAuthCredentials.h"

@interface SFTouchAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (SFOAuthCredentials *) storedCredentials;

@end

static NSString *const StoredCredentialKey = @"TouchDemo";
// Corresponds to the "Consumer Key" specified for the Connected App in your org.
static NSString *const RemoteAccessConsumerKey = @"3MVG9A2kN3Bn17humtOtYKkuZcp50xL7T1BpkKLDp4J1qPJR4FpGHvpVZo6EtnSd18sU4ARpmzwgJkFddjciw";
// Corresponds to the "Callback URL" specified for the Connected App in your org.
static NSString *const OAuthRedirectURI = @"sfdc://success";


