//
//  InfoController.h
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/19/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "Colors.h"

NS_ASSUME_NONNULL_BEGIN

@interface InfoController : UITableViewController

@property(strong, atomic) NSMutableArray<PHAsset*> *dataSource;
@property(strong, nonatomic) Colors *colors; 

@end

NS_ASSUME_NONNULL_END
