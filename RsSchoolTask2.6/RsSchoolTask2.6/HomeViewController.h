//
//  HomeViewController.h
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colors.h"
#import "ShapesContainer.h"
#import "ActionButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController

@property (strong, nonatomic) Colors *colors;
@property (strong, nonatomic) UIScrollView *mainArea;
@property (strong, nonatomic) UIStackView *labels;
@property (strong, nonatomic) UIStackView *buttons;
@property (strong, nonatomic) UIStackView *upperElements;
@property (strong, nonatomic) UILabel *phoneTypeLabel;
@property (strong, nonatomic) UILabel *phoneNameLabel;
@property (strong, nonatomic) UILabel *operationSystemLabel;
@property (strong, nonatomic) UIImageView *logoPicture;
@property (strong, nonatomic) ActionButton *cvButton;
@property (strong, nonatomic) ActionButton *startButton;
@property (strong, nonatomic) UIView *separatorUpper;
@property (strong, nonatomic) UIView *separatorLower;
@property (strong, nonatomic) ShapesContainer *shapesContainer;


@end

NS_ASSUME_NONNULL_END
