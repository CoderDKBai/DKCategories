//
//  UIButton+DKAdd.h
//  DKCategories
//
//  Created by 柏道坤 on 16/1/24.
//  Copyright © 2016年 CoderDKBai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIButtonEdgeInsetsStyle) {
    UIButtonEdgeInsetsStyleImageLeft = 0,
    UIButtonEdgeInsetsStyleImageRight,
    UIButtonEdgeInsetsStyleImageTop,
    UIButtonEdgeInsetsStyleImageBottom
};

@interface UIButton (DKAdd)

/**
 *  扩大按钮的响应范围（insets必须不被button的superview给挡住）
 */
@property (assign, nonatomic) UIEdgeInsets expandHitEdgeInsets;

- (void)layoutButtonWithEdgeInsetsStyle:(UIButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;

@end
