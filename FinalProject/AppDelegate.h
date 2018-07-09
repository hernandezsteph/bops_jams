//
//  AppDelegate.h
//  FinalProject
//
//  Created by Stephanie  Hernandez hern108@usc.edu.
//  Copyright © 2018 Stephanie  Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpotifyAudioPlayback/SpotifyAudioPlayback.h>
#import <SafariServices/SafariServices.h>
#import <SpotifyAuthentication/SpotifyAuthentication.h>
#import "LoginController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, SPTAudioStreamingDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)startAuthenticationFlow: (LoginController*) loginview;

@end

