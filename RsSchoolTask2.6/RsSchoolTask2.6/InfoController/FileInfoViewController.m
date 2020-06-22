//
//  FileInfoViewController.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/22/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import "FileInfoViewController.h"
#import <Photos/Photos.h>
#import "TextUtils.h"

@interface FileInfoViewController ()

@end

@implementation FileInfoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.colors = [[Colors alloc] init];
        self.mainArea = [[UIScrollView alloc] init];
        self.picture = [[UIImageView alloc] init];
        self.creationDateLabel = [[UILabel alloc] init];
        self.modificationDateLabel = [[UILabel alloc] init];
        self.typeLabel = [[UILabel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View did load.");
    // Do any additional setup after loading the view.
    
    self.title = @"File info";
    
    
    [self.view addSubview:self.mainArea];
    self.view.backgroundColor = self.colors.white;
    
    
    self.picture.contentMode = UIViewContentModeScaleAspectFit;
    self.picture.backgroundColor = UIColor.magentaColor;
    
    
    
    [self.mainArea addSubview:self.picture];
}

-(void) viewWillAppear:(BOOL)animated {
    PHAsset *asset = self.photoAsset;
    
    [self setUpLabels];
    
    self.picture.image = nil;
    
    self.mainArea.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [self.mainArea.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.mainArea.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.mainArea.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.mainArea.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    ]];
    self.picture.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [self.picture.topAnchor constraintEqualToAnchor:self.mainArea.topAnchor constant:10.0],
        [self.picture.leadingAnchor constraintEqualToAnchor:self.mainArea.leadingAnchor constant:10.0],
        [self.picture.widthAnchor constraintEqualToAnchor:self.mainArea.widthAnchor constant:-20.0],
    ]];
    
    NSLog(@"Picture frame before image: %@", NSStringFromCGSize(self.picture.frame.size));
    
    CGSize targetSize = CGSizeMake(self.picture.frame.size.width, self.picture.frame.size.width);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"Asset: %@", asset);
        [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:targetSize contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            NSLog(@"Info: %@", info);
            if ([[info valueForKey:PHImageResultIsDegradedKey] intValue]) {
                return;
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.picture.image = result;
                NSLog(@"Picture frame after image: %@", NSStringFromCGSize(self.picture.frame.size));
            });
        }];
    });
}

- (void) setUpLabels {
    UIStackView *labels = [[UIStackView alloc] init];
    [labels addArrangedSubview:self.creationDateLabel];
    [labels addArrangedSubview:self.modificationDateLabel];
    [labels addArrangedSubview:self.typeLabel];
    
    labels.backgroundColor = UIColor.redColor;
    labels.axis = UILayoutConstraintAxisVertical;
    labels.alignment = UIStackViewAlignmentLeading;
    labels.distribution = UIStackViewDistributionEqualCentering;
    labels.spacing = 10.0;
    
    [self.mainArea addSubview:labels];
    
    labels.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [labels.topAnchor constraintEqualToAnchor:self.picture.bottomAnchor constant:10.0],
        [labels.leadingAnchor constraintEqualToAnchor:self.mainArea.leadingAnchor constant:10.0],
        [labels.trailingAnchor constraintEqualToAnchor:self.mainArea.trailingAnchor constant:-10.0],
    ]];
    
    PHAsset *asset = self.photoAsset;
    NSMutableAttributedString *creationDate = [[NSMutableAttributedString alloc] init];
    [creationDate appendAttributedString:[[NSAttributedString alloc] initWithString:@"Creation date" attributes:getTextAttributes(self.colors.gray, 17.0, UIFontWeightRegular)]];
    [creationDate appendAttributedString:[[NSAttributedString alloc] initWithString:@"asset.creationDate" attributes:getTextAttributes(self.colors.black, 17.0, UIFontWeightRegular)]];
    self.creationDateLabel.attributedText = creationDate;
    
    NSMutableAttributedString *modificationDate = [[NSMutableAttributedString alloc] init];
    [modificationDate appendAttributedString:[[NSAttributedString alloc] initWithString:@"Modification date" attributes:getTextAttributes(self.colors.gray, 17.0, UIFontWeightRegular)]];
    [modificationDate appendAttributedString:[[NSAttributedString alloc] initWithString:@"asset.modificationDate" attributes:getTextAttributes(self.colors.black, 17.0, UIFontWeightRegular)]];
    self.modificationDateLabel.attributedText = modificationDate;
    
    NSMutableAttributedString *type = [[NSMutableAttributedString alloc] init];
    [type appendAttributedString:[[NSAttributedString alloc] initWithString:@"Type" attributes:getTextAttributes(self.colors.gray, 17.0, UIFontWeightRegular)]];
    [type appendAttributedString:[[NSAttributedString alloc] initWithString:@"asset.mediaType" attributes:getTextAttributes(self.colors.black, 17.0, UIFontWeightRegular)]];
    self.typeLabel.attributedText = type;
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
