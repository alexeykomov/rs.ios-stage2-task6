//
//  PhotoItemTableViewCell.h
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoItemTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView* preview;
@property (strong, nonatomic) UILabel* fileName;
@property (strong, nonatomic) UIImageView* fileTypeIcon;
@property (strong, nonatomic) UILabel* fileInfo;

@end

NS_ASSUME_NONNULL_END
