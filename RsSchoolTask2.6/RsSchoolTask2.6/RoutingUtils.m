//
//  RoutingUtils.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/25/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RootViewController.h"

void showRootViewControllerInternal(RootViewController *rootViewController, int controller) {
    switch (controller) {
        case 0:
            [rootViewController showMainViewController];
            break;
        case 1:
            [rootViewController showStartScreenViewController];
        default:
            break;
    }
}


void showRootViewController(int controller) {
    if (@available(iOS 13.0, *)) {
        [[[UIApplication sharedApplication] connectedScenes] enumerateObjectsUsingBlock:^(UIScene * _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"Scene: %@", obj);
            UIWindowScene *windowScene = (UIWindowScene*) obj;
            
            NSLog(@"Windows: %@", windowScene.windows);
            [windowScene.windows enumerateObjectsUsingBlock:^(UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"Window root view controller: %@", obj.rootViewController);
                if ([obj.rootViewController respondsToSelector:@selector(showMainViewController)]) {
                    RootViewController *rootViewController = (RootViewController*) obj.rootViewController;
                    showRootViewControllerInternal(rootViewController, controller);
                }
                
            }];
        }];
        
    }
    else {
        RootViewController *rootViewController = (RootViewController*) [[UIApplication sharedApplication]  delegate].window.rootViewController;
        showRootViewControllerInternal(rootViewController, controller);
    }

}

    
