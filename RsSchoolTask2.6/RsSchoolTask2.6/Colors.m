//
//  Colors.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Colors.h"

UIColor* UIColorFromHEX(int hexColor) {
    return [UIColor colorWithRed:(float)((hexColor & 0xFF0000) >> 16) / 255.0
                           green:(float)((hexColor & 0x00FF00) >> 8) / 255.0
                            blue:(float)((hexColor & 0x0000FF) >> 0)  / 255.0 alpha:1.0];
}

@implementation Colors

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.black = UIColorFromHEX(0x101010);
        self.white = UIColorFromHEX(0xFFFFFF);
        self.red = UIColorFromHEX(0xEE686A);
        self.blue = UIColorFromHEX(0x29C2D1);
        self.green = UIColorFromHEX(0x34C1A1);
        self.yellow = UIColorFromHEX(0xF9CC78);
        self.yellowHighlighted = UIColorFromHEX(0xFDF4E3);
        self.gray = UIColorFromHEX(0x707070);
    }
    return self;
}

@end


