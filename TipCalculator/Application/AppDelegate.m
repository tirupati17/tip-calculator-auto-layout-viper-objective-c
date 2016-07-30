//
//  AppDelegate.m
//  TipCalculator
//
//  Created by Tirupati Balan on 12/05/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

#import "AppDelegate.h"
#import "TipCalculatorWireFrame.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController *nv = [[UINavigationController alloc] init];
    self.window.rootViewController = nv;
    
    [self installRootViewControllerIntoWindow:self.window];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    [TipCalculatorWireFrame presentTipCalculatorModuleFrom:window];
}

@end
