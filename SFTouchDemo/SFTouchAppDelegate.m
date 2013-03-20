//
//  SFTouchAppDelegate.m
//  SFTouchDemo
//
//  Created by Justin Bailey on 3/19/13.
//  Copyright (c) 2013 Justin Bailey. All rights reserved.
//

#import "SFTouchAppDelegate.h"

@implementation SFTouchAppDelegate

+ (SFOAuthCredentials *) storedCredentials {
    return [[SFOAuthCredentials alloc] initWithIdentifier:StoredCredentialKey clientId:RemoteAccessConsumerKey encrypted:NO];
}

@end
