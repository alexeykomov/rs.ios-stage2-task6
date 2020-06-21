//
//  TextUtils.m
//  RsSchoolTask2.6
//
//  Created by Alex K on 6/21/20.
//  Copyright © 2020 Alex K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NSDictionary<NSAttributedStringKey, id>* getTextAttributes(UIColor* color, CGFloat size, UIFontWeight weight) {
    return @{
        NSForegroundColorAttributeName:color,
        NSFontAttributeName:[UIFont systemFontOfSize:size weight:weight]
    };;
};
