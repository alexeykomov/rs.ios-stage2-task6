//
//  ColoredView.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "ColoredView.h"

@implementation ColoredView

- (instancetype) initWithColor:(UIColor*)color {
    self = [super init];
    self.color = color;
    return self;
}

@end
