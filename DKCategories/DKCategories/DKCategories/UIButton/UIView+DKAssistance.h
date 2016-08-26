//
//  UIView+DKAssistance.h
//  DKCategories
//
//  Created by 柏道坤 on 15/12/29.
//  Copyright © 2015年 CoderDKBai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DKAssistance)
/**
 *  view 响应事件的额外区域
 */
@property (nonatomic, assign) UIEdgeInsets dk_extraHitTestEdgeInsets;

@end
