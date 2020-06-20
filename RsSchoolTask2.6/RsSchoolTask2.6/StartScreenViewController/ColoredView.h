//
//  ColoredView.h
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColoredView : UIView

@property (strong, nonatomic) UIColor *color;

- (instancetype)initWithColor:(UIColor*) color;
- (void) startAnimation;

@end

NS_ASSUME_NONNULL_END
