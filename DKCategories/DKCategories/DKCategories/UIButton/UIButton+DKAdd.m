//
//  UIButton+DKAdd.m
//  DKCategories
//
//  Created by 柏道坤 on 16/1/24.
//  Copyright © 2016年 CoderDKBai. All rights reserved.
//

#import "UIButton+DKAdd.h"
#import <objc/runtime.h>

@implementation UIButton (DKAdd)

- (UIEdgeInsets)expandHitEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, @selector(expandHitEdgeInsets));
    return value ? [value UIEdgeInsetsValue] : UIEdgeInsetsZero;
}
- (void)setExpandHitEdgeInsets:(UIEdgeInsets)expandHitEdgeInsets {
    NSValue *value = [NSValue valueWithUIEdgeInsets:expandHitEdgeInsets];
    objc_setAssociatedObject(self, @selector(expandHitEdgeInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (UIEdgeInsetsEqualToEdgeInsets(self.expandHitEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    UIEdgeInsets expandHitEdgeInsets = self.expandHitEdgeInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(CGRectGetMinX(bounds) - expandHitEdgeInsets.left,
                        CGRectGetMinY(bounds) - expandHitEdgeInsets.top,
                        CGRectGetWidth(bounds) + expandHitEdgeInsets.left + expandHitEdgeInsets.right,
                        CGRectGetHeight(bounds) + expandHitEdgeInsets.top + expandHitEdgeInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}

/**
 *  利用 UIButton 的 titleEdgeInsets 和 imageEdgeInsets 来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且 button 的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)dk_setImagePosition:(DKImagePosition)postion spacing:(CGFloat)spacing {
    
    CGFloat imageWidth  = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    CGFloat labelWidth  = [self.currentTitle sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].width;
    CGFloat labelHeight = [self.currentTitle sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].height;
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;
    
    switch (postion) {
            
        case DKImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing / 2, 0, spacing / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing / 2, 0, -spacing / 2);
            break;
            
        case DKImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing / 2, 0, -(labelWidth + spacing / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing / 2), 0, imageHeight + spacing / 2);
            break;
            
        case DKImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
        case DKImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
    }
}

@end
