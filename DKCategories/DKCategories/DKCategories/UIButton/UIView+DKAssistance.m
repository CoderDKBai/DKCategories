//
//  UIView+DKAssistance.m
//  DKCategories
//
//  Created by popo on 16/8/26.
//  Copyright © 2016年 CoderDKBai. All rights reserved.
//

#import "UIView+DKAssistance.h"
#import <objc/objc-runtime.h>

@implementation UIView (DKAssistance)

@dynamic extraHitTestEdgeInsets;

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(pointInside:withEvent:);
        SEL swizzledSelector = @selector(myPointInside:withEvent:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        /*
         1. 先进行addMethod是为了防止父类有要swizzle的original方法而子类没有时，如果不addMethod而直接进行exchange，则会导致将父类的方法和自定义方法进行交换，这样可能破坏父类结构导致运行时错误。
         2. 当addMethod执行成功，表示子类中没有要swizzle的方法。下一步执行的是使用original方法替换自定义方法，这个过程并不是我之前认为的两个方法的实现一致了，而是将original的父类方法实现copy到自定义方法中。这样逻辑就通了。
         3. 如果addMethod失败，说明子类有original方法。那么直接与自定义方法交换，没问题。
         */
        BOOL didAddMethod = class_addMethod(class,
                                            originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Associated Objects

- (UIEdgeInsets)extraHitTestEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, _cmd);
    return value ? [value UIEdgeInsetsValue] : UIEdgeInsetsZero;
}

- (void)setExtraHitTestEdgeInsets:(UIEdgeInsets)extraHitTestEdgeInsets {
    NSValue *value = [NSValue valueWithUIEdgeInsets:extraHitTestEdgeInsets];
    objc_setAssociatedObject(self, @selector(extraHitTestEdgeInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Method Swizzling

- (BOOL)myPointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.extraHitTestEdgeInsets, UIEdgeInsetsZero) ||
       self.hidden ||
       self.alpha < 0.01f ||
       !self.userInteractionEnabled ||
       ([self isKindOfClass:[UIControl class]] && !((UIControl*)self).enabled)) {
        return [self myPointInside:point withEvent:event];
    }
    
    UIEdgeInsets extraHitTestEdgeInsets = self.extraHitTestEdgeInsets;
    CGRect hitFrame = self.bounds;
    hitFrame = CGRectMake(CGRectGetMinX(hitFrame) - extraHitTestEdgeInsets.left,
                          CGRectGetMinY(hitFrame) - extraHitTestEdgeInsets.top,
                          CGRectGetWidth(hitFrame) + extraHitTestEdgeInsets.left + extraHitTestEdgeInsets.right,
                          CGRectGetHeight(hitFrame) + extraHitTestEdgeInsets.top + extraHitTestEdgeInsets.bottom);
    
    return CGRectContainsPoint(hitFrame, point);
}

@end
