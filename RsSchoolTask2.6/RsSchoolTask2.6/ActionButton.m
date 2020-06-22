//
//  ActionButton.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "ActionButton.h"
#import "Colors.h"

@implementation ActionButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.colors = [[Colors alloc] init];
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.colors = [[Colors alloc] init];
        [self setUp];
    }
    return self;
}

- (void) setUp {
    self.layer.cornerRadius = 55.0 / 2.0;
    self.translatesAutoresizingMaskIntoConstraints = false;
    [self.widthAnchor constraintEqualToConstant:250].active = true;
    [self.heightAnchor constraintEqualToConstant:55].active = true;
    
    [self setTitleColor:self.colors.black forState:UIControlStateNormal];
    self.backgroundColor = self.colors.yellow;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.backgroundColor = self.colors.yellowHighlighted;
        return;
    }
    self.backgroundColor = self.colors.yellow;
}

@end
