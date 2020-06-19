//
//  StartScreenViewController.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/19/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StartScreenViewController.h"

@interface StartScreenViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonStart;
@property (weak, nonatomic) IBOutlet UILabel *labelGreetings;
@property (strong, nonatomic) UIStackView *shapesContainer;


@end

@implementation StartScreenViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.buttonStart.layer.cornerRadius = 55.0 / 2.0;
    self.buttonStart.backgroundColor = UIColor.yellowColor;
    
    UIView *circle = [[UIView alloc] init];
    [circle.widthAnchor constraintEqualToConstant:70.0].active = true;
    [circle.heightAnchor constraintEqualToConstant:70.0].active = true;
    UIView *square = [[UIView alloc] init];
    [square.widthAnchor constraintEqualToConstant:70.0].active = true;
    [square.heightAnchor constraintEqualToConstant:70.0].active = true;
    UIView *triangle = [[UIView alloc] init];
    [triangle.widthAnchor constraintEqualToConstant:70.0].active = true;
    [triangle.heightAnchor constraintEqualToConstant:70.0].active = true;
    
    circle.backgroundColor = UIColor.redColor;
    square.backgroundColor = UIColor.blueColor;
    triangle.backgroundColor = UIColor.greenColor;
    
    self.shapesContainer = [[UIStackView alloc] init];
    [self.view addSubview:self.shapesContainer];
    self.shapesContainer.translatesAutoresizingMaskIntoConstraints = false;
    
    self.shapesContainer.backgroundColor = UIColor.redColor;
    self.shapesContainer.axis = UILayoutConstraintAxisHorizontal;
    self.shapesContainer.alignment = UIStackViewAlignmentCenter;
    self.shapesContainer.distribution = UIStackViewDistributionEqualCentering;
    self.shapesContainer.spacing = 20.0;
    
    [self.shapesContainer addArrangedSubview:circle];
    [self.shapesContainer addArrangedSubview:square];
    [self.shapesContainer addArrangedSubview:triangle];
    
    [[self.shapesContainer topAnchor] constraintEqualToAnchor:[self.labelGreetings bottomAnchor] constant:115].active = true;
    [[self.shapesContainer centerXAnchor] constraintEqualToAnchor:[self.view centerXAnchor]].active = true;
    
    
    NSLog(@"View loaded");
}

- (void) viewDidAppear:(BOOL) animated {
    NSLog(@"View did appear");
}

@end
