//
//  UIButton+DKAdd.h
//  DKCategories
//
//  Created by 柏道坤 on 16/1/24.
//  Copyright © 2016年 CoderDKBai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DKImagePosition) {
    DKImagePositionLeft = 0,    // 图片在左，文字在右，默认
    DKImagePositionRight,       // 图片在右，文字在左
    DKImagePositionTop,         // 图片在上，文字在下
    DKImagePositionBottom,      // 图片在下，文字在上
};

@interface UIButton (DKAdd)

/**
 *  扩大按钮的响应范围（insets必须不被button的superview给挡住）
 */
@property (assign, nonatomic) UIEdgeInsets expandHitEdgeInsets;

/**
 *  利用 UIButton 的 titleEdgeInsets 和 imageEdgeInsets 来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且 button 的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)dk_setImagePosition:(DKImagePosition)postion spacing:(CGFloat)spacing;

@end
