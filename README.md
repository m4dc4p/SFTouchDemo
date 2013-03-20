# Managing Login with the Salesforce Touch SDK for Native iOS

The Salesforce SDK for Native iOS provides well-developed
project templates for creating new applications. However, these templates cannot
be used with  ARC (Automatic Reference Counting), and you must
structure your application to inherit from their
`SFNativeRestAppDelegate` class.

The SDK does not provide much guidance when incorporating it with an
existing application. This project demonstrates how incorporate the
login process into a simple application. In particular, we show how to
use the `SFOAuthCoordinatorDelegate` protocol to manage the login process.

## Getting Started

First, clone this repository. Next, go into the
`SalesforceMobileSDK-iOS` directory (from the command line) and run
`install.sh`. (Note that we are using v1.5.3 of the Salesforce iOS SDK.)
After installing the SDK, open the `SFTouchDemo` project in XCode. You should
be able to immediately run it in the iOS simulator. 

## Managing Login

When the user clicks the "Login" button, the `SFTouchAuthController`
takes over (implemented in `SFTouchAuthController.m`).  We initiate the
login process in the `viewDidAppear:` method. We start by initializing
an instance of the `SFOAuthCredential` class.

If the user has logged in previously, the
credentials returned will contain their previous access and refresh
tokens. We revoke these credentials to force the user to login
again.

Next, we create an instance of `SFOAuthCoordinator` class, using the
credentials just created. `SFTouchAuthController` implements the
`SFOAuthCoordinatorDelegate` protocol. The `SFOAuthCoordinator` instance
uses this protocol to communicate steps in the login process.
Therefore, we set the `delegate` property on the `SFOAuthCoordinator`
instance to `self` (i.e., this instance of the
`SFTouchAuthController`). Finally, we initiate the login process by
calling the authenticate method on `SFOAuthCoordinator`.

## Managing Login with the `SFOAuthCoordinatorDelegate` Protocol

The SDK defines the `SFOAuthCoordinatorDelegate` protocol to communicate the
various steps in login process. `SFTouchAuthController`
implements this protocol. Besides the required methods,
`SFTouchAuthController` implements one optional method,
`oauthCoordinator:willBeginAuthenticationWithView:`. This method is
called when the login page is about to display, receiving a `UIWebView`
argument that represents the salesforce.com login page. In the body of
the method we replace the view on the controller with this `UIWebView`,
displaying the login page to the user.

Once the user logs in, the `oauthCoordinatorDidAuthenticate:authInfo:`
method (required by the protocol) will be called. If login
fails for some reason, `oauthCoordinator:didFailWithError:authInfo:`
will be called. In either case, we pop the current controller and
return the initial controller. 

## Managing Credentials

At this point, login has completed and authenticated
credentials will now be stored with the application. They can be
retrieved at any time by creating an instance of the
`SFOAuthCredentials` class, using the key represented by the
`StoredCredentialKey` static (found in `SFTouchAppDelegate.h`). We implemented
a static convenience method, `storedCredentials`, on `SFTouchAppDelegate` to make 
it simple to retrieve the stored credentials.

## Using Your own Connected Application

The file `SFTouchAppDelegate.h` defines three static strings:
`StoredCredentialKey`, `RemoteAccessConsumerKey`, and
`OAuthRedirectUI`. `StoredCredentialKey` is used to store credentials on
the phone -- it can be any value, as long as it is unique within the
application. The other two values can be replaced with the
corresponding settings for your Connected Application (as defined in
your org).
