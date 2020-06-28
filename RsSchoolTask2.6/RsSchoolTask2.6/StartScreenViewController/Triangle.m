//
//  Triangle.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle


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
    
    CGContextMoveToPoint(context, 0.0, 70.0);
    CGContextAddLineToPoint(context, 35.0, 0);
    CGContextAddLineToPoint(context, 70.0, 70.0);
    CGContextFillPath(context);
}

- (void)startAnimation {
    CABasicAnimation *rotation = [CABasicAnimation animation];
    rotation.toValue = [[NSNumber alloc] initWithFloat:M_PI * 2];
    rotation.keyPath = @"transform.rotation.z";
    rotation.duration = 2;
    rotation.repeatCount = HUGE_VALF;
    [self.layer addAnimation:rotation forKey:@"rotationAnimation"];
}

@end
