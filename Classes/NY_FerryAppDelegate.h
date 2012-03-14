//
//  NY_FerryAppDelegate.h
//  NY Ferry
//
//  Created by Todd Fearn on 7/14/10.
//  Copyright iDATA Corporation 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NY_FerryAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
