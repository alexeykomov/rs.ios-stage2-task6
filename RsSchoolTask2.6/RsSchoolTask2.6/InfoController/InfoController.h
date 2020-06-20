//
//  InfoController.h
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/19/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfoController : UITableViewController

@property(strong, nonatomic) NSMutableArray<PHAsset*> *dataSource;

@end

NS_ASSUME_NONNULL_END
