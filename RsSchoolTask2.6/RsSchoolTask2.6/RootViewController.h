//
//  RootViewController.h
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RootViewController : UIViewController

@property (strong, nonatomic) UIViewController *current;

- (void) showMainViewController;

@end

NS_ASSUME_NONNULL_END
