//
//  ShapesContainer.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/24/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "ShapesContainer.h"
#import "Circle.h"
#import "Triangle.h"
#import "Square.h"
#import "Colors.h"

@implementation ShapesContainer

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.colors = [[Colors alloc] init];
        [self setUp];
    }
    return self;
}

- (void) setUp {
    
    self.circle = [[Circle alloc] initWithColor:self.colors.red];
    [self.circle.widthAnchor constraintEqualToConstant:70.0].active = true;
    [self.circle.heightAnchor constraintEqualToConstant:70.0].active = true;
    self.square = [[Square alloc] initWithColor:self.colors.blue];
    [self.square.widthAnchor constraintEqualToConstant:70.0].active = true;
    [self.square.heightAnchor constraintEqualToConstant:70.0].active = true;
    self.triangle = [[Triangle alloc] initWithColor:self.colors.green];
    [self.triangle.widthAnchor constraintEqualToConstant:70.0].active = true;
    [self.triangle.heightAnchor constraintEqualToConstant:70.0].active = true;
    
    
    self.translatesAutoresizingMaskIntoConstraints = false;
    
    
    self.backgroundColor = UIColor.redColor;
    self.axis = UILayoutConstraintAxisHorizontal;
    self.alignment = UIStackViewAlignmentCenter;
    self.distribution = UIStackViewDistributionEqualCentering;
    self.spacing = 35.0;
    
    [self addArrangedSubview:self.circle];
    [self addArrangedSubview:self.square];
    [self addArrangedSubview:self.triangle];
    
    [self.heightAnchor constraintEqualToConstant:70.0].active = true;
    [self.widthAnchor constraintEqualToConstant:280.0].active = true;
    [self.heightAnchor constraintEqualToConstant:70.0].active = true;
    [self.widthAnchor constraintEqualToConstant:280.0].active = true;
}

- (void) startAnimation {
    [self.triangle startAnimation];
    [self.circle startAnimation];
    [self.square startAnimation];
}

@end
