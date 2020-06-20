//
//  RootViewController.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/20/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "RootViewController.h"
#import "StartScreenViewController.h"
#import "GalleryViewController.h"
#import "InfoController.h"
#import "HomeViewController.h"
#import "Colors.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.current = [[StartScreenViewController alloc] initWithNibName:@"StartScreen" bundle:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController:self.current];
    self.current.view.frame = self.view.bounds;
    [self.view addSubview:self.current.view];
    [self.current didMoveToParentViewController:self];
    
    // Do any additional setup after loading the view.
    
}

- (void) showMainViewController {
    Colors *colors = [[Colors alloc] init];
    
    
    UITabBarController *tabs = [[UITabBarController alloc] init];
    
    tabs.tabBar.tintColor = colors.black;
    
    InfoController *infoViewController = [[InfoController alloc] init];
    infoViewController.title = @"Info";
    UINavigationController *infoViewControllerWithNavigation = [[UINavigationController alloc ] initWithRootViewController:infoViewController];
    UIImage *infoImage = [UIImage imageNamed:@"info_unselected"];
    UITabBarItem *infoTabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:infoImage tag:0];
    
    infoTabBarItem.selectedImage = [UIImage imageNamed:@"info_selected"];
    infoViewControllerWithNavigation.tabBarItem = infoTabBarItem;
    infoViewControllerWithNavigation.navigationBar.barTintColor = colors.yellow;
    infoViewControllerWithNavigation.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:colors.black};
    
    UIViewController *galleryViewController = [[UIViewController alloc] init];
    galleryViewController.title = @"Gallery";
    UINavigationController *galleryViewControllerWithNavigation = [[UINavigationController alloc ] initWithRootViewController:galleryViewController];
    UITabBarItem *galleryTabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"gallery_unselected"] tag:1];
    galleryTabBarItem.selectedImage = [UIImage imageNamed:@"gallery_selected"];
    galleryViewControllerWithNavigation.tabBarItem = galleryTabBarItem;
    galleryViewControllerWithNavigation.navigationBar.barTintColor = colors.yellow;
    galleryViewControllerWithNavigation.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:colors.black};
    
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    homeViewController.title = @"RSSSchool Task 6";
    UINavigationController *homeViewControllerWithNavigation = [[UINavigationController alloc ] initWithRootViewController:homeViewController];
    UITabBarItem *homeTabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"home_unselected"] tag:2];
    homeTabBarItem.selectedImage = [UIImage imageNamed:@"home_selected"];
    homeViewControllerWithNavigation.tabBarItem = homeTabBarItem;
    homeViewControllerWithNavigation.navigationBar.barTintColor = colors.yellow;
    homeViewControllerWithNavigation.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:colors.black};
    
    tabs.viewControllers = @[infoViewControllerWithNavigation, galleryViewControllerWithNavigation, homeViewControllerWithNavigation];
    
    
    [self addChildViewController:tabs];
    tabs.view.frame = self.view.bounds;
    [self.view addSubview:tabs.view];
    [tabs didMoveToParentViewController:self];
    
    [self.current willMoveToParentViewController:nil];
    [self.current.view removeFromSuperview];
    [self.current removeFromParentViewController];
    
    self.current = tabs;

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
