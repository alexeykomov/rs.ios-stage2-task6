//
//  StartScreenViewController.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/19/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StartScreenViewController.h"
#import <UIKit/UIWindowScene.h>
#import "Colors.h"
#import "Circle.h"
#import "Triangle.h"
#import "Square.h"
#import "ActionButton.h"
#import "RootViewController.h"
#import "ShapesContainer.h"

@interface StartScreenViewController ()
@property (weak, nonatomic) IBOutlet ActionButton *buttonStart;
@property (weak, nonatomic) IBOutlet UILabel *labelGreetings;

@end

@implementation StartScreenViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    Colors *colors = [[Colors alloc] init];
    
    [self setUpLabelGreetings:colors];
    [self setUpShapesContainer:colors];
    [self setUpButtonStart:colors];

    NSLog(@"View loaded");
}

- (void) setUpLabelGreetings:(Colors*)colors {
    self.labelGreetings.translatesAutoresizingMaskIntoConstraints = false;
    [[self.labelGreetings centerXAnchor] constraintEqualToAnchor:[self.view centerXAnchor]].active = true;
    NSLayoutConstraint *labelGreetingsDesiredTop = [[self.labelGreetings topAnchor] constraintEqualToAnchor:[self.view topAnchor] constant:115];
    labelGreetingsDesiredTop.priority = 900.0;
    labelGreetingsDesiredTop.active = true;
    [self.labelGreetings.heightAnchor constraintEqualToConstant:55].active = true;
    [[self.labelGreetings topAnchor] constraintGreaterThanOrEqualToAnchor:[self.view topAnchor] constant:10].active = true;
    
    self.labelGreetings.textColor = colors.black;
}

- (void) setUpShapesContainer:(Colors*)colors {
    self.shapesContainer = [[ShapesContainer alloc] init];
    [self.view addSubview:self.shapesContainer];
    self.shapesContainer.translatesAutoresizingMaskIntoConstraints = false;
    
    NSLayoutConstraint *desiredDistanceFromLabelGreetings = [[self.shapesContainer topAnchor] constraintEqualToAnchor:[self.labelGreetings bottomAnchor] constant:115];
    desiredDistanceFromLabelGreetings.priority = 900.0;
    desiredDistanceFromLabelGreetings.active = true;
    [[self.shapesContainer topAnchor] constraintGreaterThanOrEqualToAnchor:[self.labelGreetings bottomAnchor] constant:50].active = true;
    [[self.shapesContainer bottomAnchor] constraintLessThanOrEqualToAnchor:[self.buttonStart topAnchor] constant:-70].active = true;
    [[self.shapesContainer centerXAnchor] constraintEqualToAnchor:[self.view centerXAnchor]].active = true;
    
    [self.shapesContainer startAnimation];
}

- (void) setUpButtonStart:(Colors*)colors {
    self.buttonStart.layer.cornerRadius = 55.0 / 2.0;
    self.buttonStart.backgroundColor = UIColor.yellowColor;
    self.buttonStart.translatesAutoresizingMaskIntoConstraints = false;
    [self.buttonStart.widthAnchor constraintEqualToConstant:250].active = true;
    [self.buttonStart.heightAnchor constraintEqualToConstant:55].active = true;
    [[self.buttonStart centerXAnchor] constraintEqualToAnchor:[self.view centerXAnchor]].active = true;
    [[self.buttonStart bottomAnchor] constraintLessThanOrEqualToAnchor:[self.view bottomAnchor] constant:-10].active = true;
    NSLayoutConstraint *buttonStartDesiredBottom = [[self.buttonStart bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor] constant:-100];
    buttonStartDesiredBottom.priority = 900.0;
    buttonStartDesiredBottom.active = true;
    
    [self.buttonStart setTitleColor:colors.black forState:UIControlStateNormal];
    self.buttonStart.backgroundColor = colors.yellow;
    
    [self.buttonStart addTarget:self action:@selector(onButtonStartPress:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) onButtonStartPress:(id) sender {
    if (@available(iOS 13.0, *)) {
        [[[UIApplication sharedApplication] connectedScenes] enumerateObjectsUsingBlock:^(UIScene * _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"Scene: %@", obj);
            UIWindowScene *windowScene = (UIWindowScene*) obj;
            
            NSLog(@"Windows: %@", windowScene.windows);
            [windowScene.windows enumerateObjectsUsingBlock:^(UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"Window root view controller: %@", obj.rootViewController);
                if ([obj.rootViewController respondsToSelector:@selector(showMainViewController)]) {
                    RootViewController *rootViewController = (RootViewController*) obj.rootViewController;
                    [rootViewController showMainViewController];
                }
                
            }];
        }];
        
    }
    else {
        RootViewController *rootViewController = (RootViewController*) [[UIApplication sharedApplication] delegate].window.rootViewController;
        [rootViewController showMainViewController];
    }
}

- (void) viewDidAppear:(BOOL) animated {
    NSLog(@"View did appear");
}

@end
