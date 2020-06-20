//
//  Circle.h
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColoredView.h"

NS_ASSUME_NONNULL_BEGIN

@interface Circle : ColoredView

/*
 0 - from 1 to 0.9
 1 - from 0.9 to 1.1
 2 - from 1.1 to 0.9
 */
@property (nonatomic) int directionOfGrowth;

@end

NS_ASSUME_NONNULL_END
