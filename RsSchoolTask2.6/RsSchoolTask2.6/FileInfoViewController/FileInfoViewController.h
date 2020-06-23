//
//  FileInfoViewController.h
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/22/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "Colors.h"
#import "ActionButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileInfoViewController : UIViewController

@property (strong, nonatomic) PHAsset *photoAsset;
@property (strong, nonatomic) UIImageView *picture;
@property (strong, nonatomic) UILabel *creationDateLabel;
@property (strong, nonatomic) UILabel *modificationDateLabel;
@property (strong, nonatomic) UILabel *typeLabel;
@property (strong, nonatomic) Colors *colors;
@property (strong, nonatomic) UIScrollView *mainArea;
@property (strong, nonatomic, nullable) NSLayoutConstraint *aspectRatioConstraint;
@property (strong, nonatomic) ActionButton *shareButton;
@property (strong, nonatomic) UIStackView *labels;
//NOTE: We're storing image in memory for faster access when sharing.
@property (strong, nonatomic) UIImage *imageToShare;
@end

NS_ASSUME_NONNULL_END
