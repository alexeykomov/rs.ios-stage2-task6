//
//  GalleryViewController.h
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/19/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "Colors.h"
#import "FileInfoViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface GalleryViewController : UICollectionViewController<UICollectionViewDelegateFlowLayout>

@property (strong, atomic) NSMutableArray<PHAsset*>* dataSource;
@property (strong, nonatomic) Colors *colors; 
@property(strong, nonatomic) FileInfoViewController *fileInfoViewController;
@property(strong, nonatomic) UINavigationController *fileInfoViewControllerWithNavigation;
@end

NS_ASSUME_NONNULL_END
