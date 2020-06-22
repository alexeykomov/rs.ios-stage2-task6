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
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.colors = [[Colors alloc] init];
    }
    return self;
}

- (void) setUp {
    
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
