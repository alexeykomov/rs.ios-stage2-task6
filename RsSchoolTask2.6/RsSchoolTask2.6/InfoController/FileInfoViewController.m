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
#import "ActionButton.h"

@interface FileInfoViewController ()

@end

@implementation FileInfoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.aspectRatioConstraint = nil;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View did load.");
    // Do any additional setup after loading the view.
    
    self.title = @"File info";
    
    self.colors = [[Colors alloc] init];
    self.mainArea = [[UIScrollView alloc] init];
    self.picture = [[UIImageView alloc] init];
    self.creationDateLabel = [[UILabel alloc] init];
    self.modificationDateLabel = [[UILabel alloc] init];
    self.typeLabel = [[UILabel alloc] init];
    self.shareButton = [[ActionButton alloc] init];
    self.labels = [[UIStackView alloc] init];
    
    [self.view addSubview:self.mainArea];
    self.view.backgroundColor = self.colors.white;
    self.mainArea.backgroundColor = self.colors.white;
    
    self.picture.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.mainArea addSubview:self.picture];
    
    [self.labels addArrangedSubview:self.creationDateLabel];
    [self.labels addArrangedSubview:self.modificationDateLabel];
    [self.labels addArrangedSubview:self.typeLabel];
    [self.shareButton setTitle:@"Share" forState:UIControlStateNormal];
    
    [self.mainArea addSubview:self.labels];
    [self.mainArea addSubview:self.shareButton];
    
    [self setUpLabels];
}

-(void) viewWillAppear:(BOOL)animated {
    PHAsset *asset = self.photoAsset;
    
    self.picture.image = nil;
    CGFloat aspectRatio = (CGFloat) asset.pixelHeight / (CGFloat) asset.pixelWidth;
    NSLog(@"Aspect ratio: %f", aspectRatio);
    
    if (self.aspectRatioConstraint) {
        [NSLayoutConstraint deactivateConstraints:@[self.aspectRatioConstraint]];
    }
    
    self.aspectRatioConstraint = [self.picture.heightAnchor constraintEqualToAnchor:self.picture.widthAnchor multiplier:aspectRatio];
    
    self.mainArea.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [self.mainArea.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.mainArea.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.mainArea.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.mainArea.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    ]];
    self.picture.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:
     @[[self.picture.topAnchor constraintEqualToAnchor:self.mainArea.topAnchor constant:10.0],
       [self.picture.leadingAnchor constraintEqualToAnchor:self.mainArea.leadingAnchor constant:10.0],
       [self.picture.widthAnchor constraintEqualToAnchor:self.mainArea.widthAnchor constant:-20.0],
       self.aspectRatioConstraint
     ]];
    
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
                [self.picture setNeedsLayout];
                [self.picture layoutIfNeeded];
                NSLog(@"Picture frame after image: %@", NSStringFromCGSize(self.picture.frame.size));
            });
        }];
    });
}

- (void) setUpLabels {
   
    self.shareButton.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [self.shareButton.centerXAnchor constraintEqualToAnchor:self.mainArea.centerXAnchor],
        [self.shareButton.bottomAnchor constraintEqualToAnchor:self.mainArea.bottomAnchor constant:-30.0]
    ]];
    
    self.labels.backgroundColor = UIColor.magentaColor;
    self.labels.axis = UILayoutConstraintAxisVertical;
    self.labels.alignment = UIStackViewAlignmentLeading;
    self.labels.distribution = UIStackViewDistributionEqualCentering;
    self.labels.spacing = 10.0;
    
    
    
    self.labels.translatesAutoresizingMaskIntoConstraints = false;
    

    [NSLayoutConstraint activateConstraints:@[
        [self.labels.topAnchor constraintEqualToAnchor:self.picture.bottomAnchor constant:30.0],
        [self.labels.leadingAnchor constraintEqualToAnchor:self.mainArea.leadingAnchor constant:10.0],
        [self.labels.trailingAnchor constraintEqualToAnchor:self.mainArea.trailingAnchor constant:-10.0],
        //NOTE: The last element in scroll view must be pinned down to the scroll view bottom
        //https://stackoverflow.com/a/54577278/2358411
        [self.labels.bottomAnchor constraintEqualToAnchor:self.shareButton.topAnchor constant:-30.0],
    ]];
    
    
    PHAsset *asset = self.photoAsset;
    NSMutableAttributedString *creationDate = [[NSMutableAttributedString alloc] init];
    [creationDate appendAttributedString:[[NSAttributedString alloc] initWithString:@"Creation date: " attributes:getTextAttributes(self.colors.gray, 17.0, UIFontWeightRegular)]];
    [creationDate appendAttributedString:[[NSAttributedString alloc] initWithString:[self getDateHint:asset.creationDate] attributes:getTextAttributes(self.colors.black, 17.0, UIFontWeightRegular)]];
    self.creationDateLabel.attributedText = creationDate;
    
    NSMutableAttributedString *modificationDate = [[NSMutableAttributedString alloc] init];
    [modificationDate appendAttributedString:[[NSAttributedString alloc] initWithString:@"Modification date: " attributes:getTextAttributes(self.colors.gray, 17.0, UIFontWeightRegular)]];
    [modificationDate appendAttributedString:[[NSAttributedString alloc] initWithString:[self getDateHint:asset.modificationDate] attributes:getTextAttributes(self.colors.black, 17.0, UIFontWeightRegular)]];
    self.modificationDateLabel.attributedText = modificationDate;
    
    NSMutableAttributedString *type = [[NSMutableAttributedString alloc] init];
    [type appendAttributedString:[[NSAttributedString alloc] initWithString:@"Type: " attributes:getTextAttributes(self.colors.gray, 17.0, UIFontWeightRegular)]];
    [type appendAttributedString:[[NSAttributedString alloc] initWithString:[self getMediaTypeHint:asset.mediaType] attributes:getTextAttributes(self.colors.black, 17.0, UIFontWeightRegular)]];
    self.typeLabel.attributedText = type;
}

- (NSString*) getMediaTypeHint:(PHAssetMediaType) mediaType {
    switch (mediaType) {
        case PHAssetMediaTypeAudio: return @"Audio";
        case PHAssetMediaTypeImage: return @"Image";
        case PHAssetMediaTypeVideo: return @"Video";
        default: return @"Other";
    }
}

- (NSString*) getDateHint:(NSDate*)input {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"ss:mm:HH dd:MM:YYYY";
    NSString *hint = [fmt stringFromDate:input];
    return hint;
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
