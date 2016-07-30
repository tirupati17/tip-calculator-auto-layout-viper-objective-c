//
//  TCRootWireframe.m
//  TipCalculator
//
//  Created by Tirupati Balan on 28/05/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

#import "TCRootWireframe.h"

@implementation TCRootWireframe

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window {
    UINavigationController *navigationController = [self navigationControllerFromWindow:window];
    navigationController.viewControllers = @[viewController];
}

- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window {
    return (UINavigationController *)[window rootViewController];
}

@end
