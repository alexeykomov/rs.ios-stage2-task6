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
    
    [NSLayoutConstraint activateConstraints: @[
        [self.fileName.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.fileName.heightAnchor constraintEqualToConstant:100.0]
    ]];
}

@end
