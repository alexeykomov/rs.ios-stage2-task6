//
//  ShapesContainer.h
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/24/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colors.h"
#import "Triangle.h"
#import "Square.h"
#import "Circle.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShapesContainer : UIView

@property (strong, nonatomic) UIStackView *shapesContainer;
@property (strong, nonatomic) Triangle *triangle;
@property (strong, nonatomic) Square *square;
@property (strong, nonatomic) Circle *circle; 
@property (strong, nonatomic) Colors *colors;

- (void) startAnimation;

@end

NS_ASSUME_NONNULL_END
