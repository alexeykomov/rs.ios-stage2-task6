//
//  InfoController.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/19/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "InfoController.h"
#import <Photos/Photos.h>
#import "PhotoItemTableViewCell.h"
#import "Colors.h"
#import "FileInfoViewController.h"

@interface InfoController ()

@end

@implementation InfoController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.colors = [[Colors alloc] init];
        self.fileInfoViewController = [[FileInfoViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"File info view controller: %@", self.fileInfoViewController);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    //[[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];
    self.dataSource = [[NSMutableArray alloc] init];
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        NSLog(@"Authorization status: %ld", status);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            PHFetchOptions *options = [[PHFetchOptions alloc] init];
            options.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:false]];
            PHFetchResult *allPhotos = [PHAsset fetchAssetsWithOptions:options];
            [allPhotos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
              
                [self.dataSource addObject:obj];
            }];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });

        });
    }];
    
    [self.tableView registerClass:PhotoItemTableViewCell.class forCellReuseIdentifier:@"photoCellId"];
    //[self.tableView reloadData];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.dataSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PhotoItemTableViewCell *cell = (PhotoItemTableViewCell*) [tableView dequeueReusableCellWithIdentifier:@"photoCellId" forIndexPath:indexPath];
    PHAsset *asset = self.dataSource[indexPath.row];
    NSArray<PHAssetResource*> *assetResources = [PHAssetResource assetResourcesForAsset:asset];
    NSString *fileName = @"";
    if ([assetResources count] > 0) {
        fileName = [assetResources objectAtIndex:0].originalFilename;
    }
    
    
    cell.fileName.attributedText = [[NSAttributedString alloc] initWithString:fileName attributes:@{
        NSForegroundColorAttributeName:self.colors.black,
        NSFontAttributeName:[UIFont systemFontOfSize:17.0 weight:UIFontWeightSemibold]
    }];
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(160, 160) contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        cell.preview.contentMode = UIViewContentModeScaleAspectFill;
        cell.preview.layer.masksToBounds = YES;
        cell.preview.image = result;
                
        switch (asset.sourceType) {
            case PHAssetResourceTypeVideo:
                cell.fileTypeIcon.image = [UIImage imageNamed:@"video"];
                cell.fileInfo.attributedText = [self getSmallTextForLabel:[[NSString alloc] initWithFormat:@"%lux%lu %f",
                                                                           (unsigned long)asset.pixelWidth,
                                                                           (unsigned long)asset.pixelHeight,
                                                                           asset.duration]
                                                ];
                break;
            case PHAssetResourceTypeAudio:
                cell.fileTypeIcon.image = [UIImage imageNamed:@"audio"];
                cell.fileInfo.attributedText = [self getSmallTextForLabel:[[NSString alloc] initWithFormat:@"%f", asset.duration]];
                break;
            case PHAssetResourceTypePhoto:
                cell.fileTypeIcon.image = [UIImage imageNamed:@"image"];
                cell.fileInfo.attributedText = [self getSmallTextForLabel:[[NSString alloc] initWithFormat:@"%lux%lu",
                                                                           (unsigned long)asset.pixelWidth,
                                                                           (unsigned long)asset.pixelHeight]];
                NSLog(@"icon image: %@", cell.fileTypeIcon.image);
                break;
            default:
                cell.fileTypeIcon.image = [UIImage imageNamed:@"other"];
                cell.fileInfo.text = @"";
                break;
        }
    }];
    return cell;
}

- (NSAttributedString*) getTextForLabel:(NSString*)input color:(UIColor*)color
                                  size:(CGFloat)size
                                weight:(UIFontWeight)weight {
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:input attributes:@{
          NSForegroundColorAttributeName:color,
          NSFontAttributeName:[UIFont systemFontOfSize:size weight:weight]
      }];
    return attributedText;
}

- (NSAttributedString*) getSmallTextForLabel:(NSString*)input {
    return [self getTextForLabel:input color:self.colors.black size:12.0 weight:UIFontWeightRegular];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.fileInfoViewController.photoAsset = self.dataSource[indexPath.row];
    [self.navigationController pushViewController:self.fileInfoViewController animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
