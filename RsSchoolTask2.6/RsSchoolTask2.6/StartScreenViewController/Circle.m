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
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveLinear
     
                     animations:^{
        float cx = 1;
        float cy = 1;
        float delta = 0.1;
        switch (self.directionOfGrowth) {
            case 0: cx = 0.9; cy = 0.9; break;
            case 1: cx = 1.1 / 0.9; cy = 1.1 / 0.9; break;
            case 2: cx = 0.9 / 1.1; cy = 0.9 / 1.1; break;
        }
        CGAffineTransform transform = CGAffineTransformScale(self.transform, cx, cy);
        
        self.transform = transform;
     
    }
                     completion:^(BOOL finished) {
        if (self.directionOfGrowth == 0 || self.directionOfGrowth == 2) {
            self.directionOfGrowth = 1;
        } else {
            self.directionOfGrowth = 2;
        };
        [self startAnimation];
        
    }];
}


@end
