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

@end

@implementation StartScreenViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.buttonStart.layer.cornerRadius = 55.0 / 2.0;
    self.buttonStart.backgroundColor = UIColor.yellowColor;
    
    NSLog(@"View loaded");
}

- (void) viewDidAppear:(BOOL) animated {
    NSLog(@"View did appear");
}

@end
