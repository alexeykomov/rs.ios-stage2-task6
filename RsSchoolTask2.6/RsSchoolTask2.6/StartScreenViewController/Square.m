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

- (void)startAnimation {
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveLinear
     
                     animations:^{
        float ty= 1;
        switch (self.directionOfMovement) {
            case 0: ty = -7; break;
            case 1: ty = 14; break;
            case 2: ty = -14; break;
        }
        CGAffineTransform transform = CGAffineTransformTranslate(self.transform, 0, ty);
        self.transform = transform;
     
    }
                     completion:^(BOOL finished) {
        if (self.directionOfMovement == 0 || self.directionOfMovement == 2) {
            self.directionOfMovement = 1;
        } else {
            self.directionOfMovement = 2;
        };
        [self startAnimation];
        
    }];
}

@end
