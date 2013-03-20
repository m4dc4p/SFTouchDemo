//
//  SFTouchAppDelegate.h
//  SFTouchDemo
//
//  Created by Justin Bailey on 3/19/13.
//  Copyright (c) 2013 Justin Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFOAuthInfo.h"

@interface SFTouchAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SFOAuthInfo * cred;

+ (SFTouchAppDelegate *) sharedInstance;
@end
