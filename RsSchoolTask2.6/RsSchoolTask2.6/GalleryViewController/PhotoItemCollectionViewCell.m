//
//  PhotoItemCollectionViewCell.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/21/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "PhotoItemCollectionViewCell.h"

@implementation PhotoItemCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void) setUp {
    
    self.preview = [[UIImageView alloc] init];
    
    [self addSubview:self.preview];
    
    self.preview.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints: @[
        [self.preview.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:0.0],
        [self.preview.topAnchor constraintEqualToAnchor:self.topAnchor constant:0.0],
        [self.preview.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0.0],
        [self.preview.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:0.0]
    ]];
    
    self.selectedBackgroundView = [[UIView alloc] init];
    self.selectedBackgroundView.backgroundColor = self.colors.yellowHighlighted;
    self.backgroundColor = self.colors.white;
}

@end
