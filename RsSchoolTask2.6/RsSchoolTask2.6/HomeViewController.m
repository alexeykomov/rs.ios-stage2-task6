//
//  HomeViewController.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "HomeViewController.h"
#import "Colors.h"
#import "TextUtils.h"
#import "ShapesContainer.h"
#import "ActionButton.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View did load.");
    // Do any additional setup after loading the view.
    
    self.colors = [[Colors alloc] init];
    self.mainArea = [[UIScrollView alloc] init];
    
    self.labels = [[UIStackView alloc] init];
    self.buttons = [[UIStackView alloc] init];
    self.phoneNameLabel = [[UILabel alloc] init];
    self.phoneTypeLabel = [[UILabel alloc] init];
    self.operationSystemLabel = [[UILabel alloc] init];
    self.cvButton = [[ActionButton alloc] init];
    self.startButton = [[ActionButton alloc] init];
    self.upperElements = [[UIStackView alloc] init];
    self.logoPicture = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple"]];
    self.separatorLower = [[UIView alloc] init];
    self.separatorUpper = [[UIView alloc] init];
    self.shapesContainer = [[ShapesContainer alloc] init];
    
    [self.view addSubview:self.mainArea];
    self.view.backgroundColor = self.colors.white;
    self.mainArea.backgroundColor = self.colors.white;
    
    self.separatorLower.backgroundColor = self.colors.gray;
    self.separatorUpper.backgroundColor = self.colors.gray;
    
    [self.mainArea addSubview:self.upperElements];
    [self.mainArea addSubview:self.separatorUpper];
    [self.mainArea addSubview:self.shapesContainer];
    [self.mainArea addSubview:self.separatorLower];
    [self.mainArea addSubview:self.buttons];
    
    [self.upperElements addArrangedSubview:self.logoPicture];
    [self.upperElements addArrangedSubview:self.labels];
    
    [self.labels addArrangedSubview:self.phoneNameLabel];
    [self.labels addArrangedSubview:self.phoneTypeLabel];
    [self.labels addArrangedSubview:self.operationSystemLabel];
    
    [self.buttons addArrangedSubview:self.self.cvButton];
    [self.buttons addArrangedSubview:self.self.startButton];
    
    [self.cvButton setTitle:@"Open Git CV" forState:UIControlStateNormal];
    [self.startButton setTitle:@"Go to start!" forState:UIControlStateNormal];
    
    
    [self.cvButton addTarget:self action:@selector(onSharePress:) forControlEvents:UIControlEventTouchUpInside];
    [self.startButton addTarget:self action:@selector(onSharePress:) forControlEvents:UIControlEventTouchUpInside];

    self.mainArea.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [self.mainArea.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.mainArea.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.mainArea.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.mainArea.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
    
    [self setUpUpperElements];
    [self setUpSeparators];
    [self setUpShapesContainer];
    [self setUpButtons];
    
    [self.shapesContainer startAnimation];
}

- (void) viewDidAppear:(BOOL) animated {
}

- (void) setUpSeparators {
    self.separatorUpper.translatesAutoresizingMaskIntoConstraints = false;
    self.separatorLower.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [self.separatorUpper.leadingAnchor constraintEqualToAnchor:self.mainArea.leadingAnchor constant:50.0],
        [self.separatorUpper.widthAnchor constraintEqualToAnchor:self.mainArea.widthAnchor constant:-100.0],
        [self.separatorLower.leadingAnchor constraintEqualToAnchor:self.mainArea.leadingAnchor constant:50.0],
        [self.separatorLower.widthAnchor constraintEqualToAnchor:self.mainArea.widthAnchor constant:-100.0],
        [self.separatorUpper.heightAnchor constraintEqualToConstant:2.0],
        [self.separatorLower.heightAnchor constraintEqualToConstant:2.0]
    ]];
}

- (void) setUpShapesContainer {
    self.shapesContainer.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [self.shapesContainer.topAnchor constraintEqualToAnchor:self.separatorUpper.bottomAnchor constant:60],
        [self.shapesContainer.centerXAnchor constraintEqualToAnchor:self.mainArea.centerXAnchor],
        [self.shapesContainer.bottomAnchor constraintEqualToAnchor:self.separatorLower.topAnchor constant:-60],
    ]];
}

- (void) setUpUpperElements {
    self.upperElements.axis = UILayoutConstraintAxisHorizontal;
    self.upperElements.alignment = UIStackViewAlignmentCenter;
    self.upperElements.distribution = UIStackViewDistributionFill;
    self.upperElements.spacing = 30.0;
    
    self.upperElements.translatesAutoresizingMaskIntoConstraints = false;
    
    [self setUpLabels];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.upperElements.topAnchor constraintEqualToAnchor:self.mainArea.topAnchor constant:50.0],
        [self.upperElements.leadingAnchor constraintEqualToAnchor:self.mainArea.leadingAnchor constant:50.0],
        
        [self.upperElements.trailingAnchor constraintEqualToAnchor:self.mainArea.trailingAnchor constant:-50.0],
        
        [self.upperElements.bottomAnchor constraintEqualToAnchor:self.separatorUpper.topAnchor constant:-60.0],
        
    ]];
}

- (void) setUpLabels {
    self.labels.backgroundColor = UIColor.magentaColor;
    self.labels.axis = UILayoutConstraintAxisVertical;
    self.labels.alignment = UIStackViewAlignmentLeading;
    self.labels.distribution = UIStackViewDistributionEqualCentering;
    self.labels.spacing = 10.0;
    
    self.labels.translatesAutoresizingMaskIntoConstraints = false;
    
    self.phoneNameLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.phoneTypeLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.operationSystemLabel.translatesAutoresizingMaskIntoConstraints = false;
    
//    [NSLayoutConstraint activateConstraints:@[
//        [self.labels.widthAnchor constraintEqualToConstant:100],
//        [self.labels.heightAnchor constraintEqualToConstant:100],
//    ]];
    
   NSAttributedString *phoneName = [[NSAttributedString alloc] initWithString:@"My iPhone" attributes:getTextAttributes(self.colors.black, 17.0, UIFontWeightRegular)];
    self.phoneNameLabel.attributedText = phoneName;
    
    NSAttributedString *phoneType = [[NSAttributedString alloc] initWithString:@"iPhone" attributes:getTextAttributes(self.colors.black, 17.0, UIFontWeightRegular)];
    self.phoneTypeLabel.attributedText = phoneType;
    
    NSAttributedString *operationSystem = [[NSAttributedString alloc] initWithString:@"iOS 13.5" attributes:getTextAttributes(self.colors.black, 17.0, UIFontWeightRegular)];
    
    self.operationSystemLabel.attributedText = operationSystem;
}


- (void) setUpButtons {
    self.buttons.backgroundColor = UIColor.magentaColor;
    self.buttons.axis = UILayoutConstraintAxisVertical;
    self.buttons.alignment = UIStackViewAlignmentLeading;
    self.buttons.distribution = UIStackViewDistributionEqualCentering;
    self.buttons.spacing = 20.0;
    
    self.buttons.translatesAutoresizingMaskIntoConstraints = false;
    self.separatorLower.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.buttons.topAnchor constraintEqualToAnchor:self.separatorLower.bottomAnchor constant:60.0],
        [self.buttons.centerXAnchor constraintEqualToAnchor:self.mainArea.centerXAnchor],
        [self.buttons.bottomAnchor constraintEqualToAnchor:self.mainArea.bottomAnchor constant:-30.0],
    ]];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
