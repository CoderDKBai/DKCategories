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

@end
