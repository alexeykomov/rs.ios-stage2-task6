//
//  Square.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "Square.h"

@implementation Square

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
    CGContextFillRect(context, rect);
}

- (void) startAnimation {
    
    CAKeyframeAnimation *floating = [CAKeyframeAnimation animation];
    floating.keyPath = @"position.y";
    floating.values = @[@0, @-7, @+7, @+7, @-7, @0];
    floating.keyTimes = @[@0, @0.5, @0.5, @0.5, @0.5, @1];
    floating.duration = 1;
    
    floating.additive = YES;
    
    floating.repeatCount = HUGE_VALF;
    
    [self.layer addAnimation:floating forKey:@"floatingAnimation"];
}

@end
