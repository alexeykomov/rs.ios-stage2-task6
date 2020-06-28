//
//  Circle.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "Circle.h"
#import "ColoredView.h"

@implementation Circle


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 255.0, 255.0, 255.0, 1.0);
    CGContextFillRect(context, rect);
    
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    CGFloat alpha = 0.0;
    
    [self.color getRed:&red green:&green blue:&blue alpha:&alpha];
    CGContextSetRGBFillColor(context, red, green, blue, alpha);
    
    CGContextFillEllipseInRect(context, CGRectMake(0, 0, 70, 70));
    
}

- (void)startAnimation {
    CAKeyframeAnimation *oscillation = [CAKeyframeAnimation animation];
    oscillation.keyPath = @"transform.scale";
    oscillation.values = @[@1.0, @0.9, @1.0, @1.1, @1.0];
    oscillation.keyTimes = @[@0, @(1.0/4.0), @(2.0/4.0), @(3.0/4.0), @1];
    oscillation.duration = 1;
    
    oscillation.additive = NO;
    
    oscillation.repeatCount = HUGE_VALF;
    
    [self.layer addAnimation:oscillation forKey:@"oscillationAnimation"];
}


@end
