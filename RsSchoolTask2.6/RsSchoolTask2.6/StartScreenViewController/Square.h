//
//  Square.h
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "ColoredView.h"

NS_ASSUME_NONNULL_BEGIN

@interface Square : ColoredView

/*
 0 - from original position down
 1 - from bottom position to upper position
 2 - from upper position to bottom position
 */
@property (nonatomic) int directionOfMovement;

@end

NS_ASSUME_NONNULL_END
