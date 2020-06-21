//
//  PhotoItemTableViewCell.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "PhotoItemTableViewCell.h"

@implementation PhotoItemTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setUp {
    self.preview = [[UIImageView alloc] init];
    self.fileName = [[UILabel alloc] init];
    self.fileTypeIcon = [[UIImageView alloc] init];
    self.fileInfo = [[UILabel alloc] init];
 
    [self addSubview:self.preview];
    [self addSubview:self.fileName];
    [self addSubview:self.fileTypeIcon];
    [self addSubview:self.fileInfo];
    
    self.fileName.translatesAutoresizingMaskIntoConstraints = false;
    self.preview.translatesAutoresizingMaskIntoConstraints = false;
    self.fileTypeIcon.translatesAutoresizingMaskIntoConstraints = false;
    self.fileInfo.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints: @[
        [self.preview.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10.0],
        [self.preview.topAnchor constraintEqualToAnchor:self.topAnchor constant:10.0],
        [self.preview.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-10.0],
        [self.preview.widthAnchor constraintEqualToAnchor:self.preview.heightAnchor],
        
        [self.fileName.leadingAnchor constraintEqualToAnchor:self.preview.trailingAnchor constant:10.0],
        [self.fileName.topAnchor constraintEqualToAnchor:self.topAnchor constant:25.0],
        [self.fileName.trailingAnchor constraintLessThanOrEqualToAnchor:self.trailingAnchor constant:-10.0],
        [self.fileName.heightAnchor constraintEqualToConstant:20.0],
        
        [self.fileTypeIcon.leadingAnchor constraintEqualToAnchor:self.preview.trailingAnchor constant:10.0],
        [self.fileTypeIcon.topAnchor constraintEqualToAnchor:self.fileName.bottomAnchor constant:10.0],
        
        [self.fileInfo.leadingAnchor constraintEqualToAnchor:self.fileTypeIcon.trailingAnchor constant:7.0],
        [self.fileInfo.centerYAnchor constraintEqualToAnchor:self.fileTypeIcon.centerYAnchor],
    ]];
}

@end
