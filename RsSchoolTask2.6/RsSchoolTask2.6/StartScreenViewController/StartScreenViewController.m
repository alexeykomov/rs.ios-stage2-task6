//
//  StartScreenViewController.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/19/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StartScreenViewController.h"
#import "Colors.h"
#import "Circle.h"
#import "Triangle.h"
#import "Square.h"
#import "ActionButton.h"

@interface StartScreenViewController ()
@property (weak, nonatomic) IBOutlet ActionButton *buttonStart;
@property (weak, nonatomic) IBOutlet UILabel *labelGreetings;
@property (strong, nonatomic) UIStackView *shapesContainer;

@end

@implementation StartScreenViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    Colors *colors = [[Colors alloc] init];
    
    self.buttonStart.layer.cornerRadius = 55.0 / 2.0;
    self.buttonStart.backgroundColor = UIColor.yellowColor;
    self.buttonStart.translatesAutoresizingMaskIntoConstraints = false;
    [self.buttonStart.widthAnchor constraintEqualToConstant:250].active = true;
    [self.buttonStart.heightAnchor constraintEqualToConstant:55].active = true;
    [[self.buttonStart centerXAnchor] constraintEqualToAnchor:[self.view centerXAnchor]].active = true;
    [[self.buttonStart bottomAnchor] constraintLessThanOrEqualToAnchor:[self.view bottomAnchor] constant:-10].active = true;
    NSLayoutConstraint *buttonStartDesiredBottom = [[self.buttonStart bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor] constant:-100];
    buttonStartDesiredBottom.active = true;
    buttonStartDesiredBottom.priority = 900.0;
    

    self.labelGreetings.translatesAutoresizingMaskIntoConstraints = false;
    [[self.labelGreetings centerXAnchor] constraintEqualToAnchor:[self.view centerXAnchor]].active = true;
    NSLayoutConstraint *labelGreetingsDesiredTop = [[self.labelGreetings topAnchor] constraintEqualToAnchor:[self.view topAnchor] constant:115];
    labelGreetingsDesiredTop.active = true;
    labelGreetingsDesiredTop.priority = 900.0;
    [self.labelGreetings.heightAnchor constraintEqualToConstant:55].active = true;
    [[self.labelGreetings topAnchor] constraintGreaterThanOrEqualToAnchor:[self.view topAnchor] constant:10].active = true;
    

    
    Circle *circle = [[Circle alloc] initWithColor:colors.red];
    [circle.widthAnchor constraintEqualToConstant:70.0].active = true;
    [circle.heightAnchor constraintEqualToConstant:70.0].active = true;
    Square *square = [[Square alloc] initWithColor:colors.blue];
    [square.widthAnchor constraintEqualToConstant:70.0].active = true;
    [square.heightAnchor constraintEqualToConstant:70.0].active = true;
    Triangle *triangle = [[Triangle alloc] initWithColor:colors.green];
    [triangle.widthAnchor constraintEqualToConstant:70.0].active = true;
    [triangle.heightAnchor constraintEqualToConstant:70.0].active = true;
    
    self.shapesContainer = [[UIStackView alloc] init];
    [self.view addSubview:self.shapesContainer];
    self.shapesContainer.translatesAutoresizingMaskIntoConstraints = false;
    
    self.shapesContainer.backgroundColor = UIColor.redColor;
    self.shapesContainer.axis = UILayoutConstraintAxisHorizontal;
    self.shapesContainer.alignment = UIStackViewAlignmentCenter;
    self.shapesContainer.distribution = UIStackViewDistributionEqualCentering;
    self.shapesContainer.spacing = 35.0;
    
    [self.shapesContainer addArrangedSubview:circle];
    [self.shapesContainer addArrangedSubview:square];
    [self.shapesContainer addArrangedSubview:triangle];
    
    [self.shapesContainer.heightAnchor constraintEqualToConstant:70.0].active = true;
    NSLayoutConstraint *desiredDistanceFromLabelGreetings = [[self.shapesContainer topAnchor] constraintEqualToAnchor:[self.labelGreetings bottomAnchor] constant:115];
    desiredDistanceFromLabelGreetings.active = true;
    desiredDistanceFromLabelGreetings.priority = 900.0;
    [[self.shapesContainer topAnchor] constraintGreaterThanOrEqualToAnchor:[self.labelGreetings bottomAnchor] constant:50].active = true;
    [[self.shapesContainer bottomAnchor] constraintLessThanOrEqualToAnchor:[self.buttonStart topAnchor] constant:-70].active = true;
    [[self.shapesContainer centerXAnchor] constraintEqualToAnchor:[self.view centerXAnchor]].active = true;
    
    self.labelGreetings.textColor = colors.black;
    [self.buttonStart setTitleColor:colors.black forState:UIControlStateNormal];
    self.buttonStart.backgroundColor = colors.yellow;

    [triangle startAnimation];
    [circle startAnimation];
    [square startAnimation];
   
    NSLog(@"View loaded");
}

- (void) viewDidAppear:(BOOL) animated {
    NSLog(@"View did appear");
}

@end
