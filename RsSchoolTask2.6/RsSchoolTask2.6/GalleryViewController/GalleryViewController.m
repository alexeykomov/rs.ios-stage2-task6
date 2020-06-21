//
//  GalleryViewController.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/19/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "GalleryViewController.h"
#import "PhotoItemCollectionViewCell.h"
#import <Photos/Photos.h>
#import "Colors.h"

@interface GalleryViewController ()

@end

@implementation GalleryViewController

static NSString * const reuseIdentifier = @"photoCellId";

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.colors = [[Colors alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[PhotoItemCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.dataSource = [[NSMutableArray alloc] init];
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            PHFetchOptions *options = [[PHFetchOptions alloc] init];
            options.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:false]];
            PHFetchResult *allPhotos = [PHAsset fetchAssetsWithOptions:options];
            [allPhotos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.dataSource addObject:obj];
            }];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        });

    }];
    
    self.collectionView.backgroundColor = self.colors.white;
    self.collectionView.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*) self.collectionViewLayout;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    int numberOfSections = ceil((float)[self.dataSource count] / 3.0);
    NSLog(@"Data source count: %d", [self.dataSource count]);
    NSLog(@"Number of sections: %d", numberOfSections);
    return numberOfSections;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForItemAtIndexPath method, index path: %@", indexPath);
    long index = indexPath.row + indexPath.section * 3;

    PhotoItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (index >= [self.dataSource count]) {
        return cell;
    }
    
    PHAsset *asset = self.dataSource[index];
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(160, 160) contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        cell.preview.contentMode = UIViewContentModeScaleAspectFill;
        cell.preview.layer.masksToBounds = YES;
        cell.preview.image = result;
    }];
    
    return cell;
}

#pragma mark <UICollectionViewDelegateFlowLayout>

int INSET = 5;
int SPACING = 5;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    long index = indexPath.row + indexPath.section * 3;
    if (index >= [self.dataSource count]) {
        return CGSizeZero;
    }
    
    CGRect mainFrame = self.collectionView.frame;
    return CGSizeMake((mainFrame.size.width - INSET * 2 - SPACING * 2) / 3,
                      (mainFrame.size.width - INSET * 2 - SPACING * 2) / 3);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return SPACING;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section > 0) {
        return UIEdgeInsetsMake(0, INSET, INSET, INSET);
    }
    return UIEdgeInsetsMake(INSET, INSET, INSET, INSET);
}

#pragma mark <UICollectionViewDelegate>


// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}



// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Highlight cell at index path: %@", indexPath);
    PhotoItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Selected cell at index path: %@", indexPath);
    PhotoItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
}



// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    NSLog(@"Pressend on %@", indexPath);
}


@end
