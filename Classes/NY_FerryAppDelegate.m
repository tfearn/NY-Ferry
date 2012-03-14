//
//  NY_FerryAppDelegate.m
//  NY Ferry
//
//  Created by Todd Fearn on 7/14/10.
//  Copyright iDATA Corporation 2010. All rights reserved.
//

#import "NY_FerryAppDelegate.h"

@implementation NY_FerryAppDelegate

@synthesize window;
@synthesize tabBarController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
    [window makeKeyAndVisible];
	
	return YES;
}

- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

