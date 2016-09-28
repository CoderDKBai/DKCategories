//
//  NSString+DKAssistance.h
//  DKCategories
//
//  Created by 柏道坤 on 2016/9/28.
//  Copyright © 2016年 CoderDKBai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (DKAssistance)

- (CGSize)dk_sizeWithFont:(UIFont *)font
                 forWidth:(CGFloat)width
              lineSpacing:(CGFloat)lineSpacing
            numberOfLines:(NSInteger)numberOfLines;

- (CGSize)dk_sizeWithFont:(UIFont *)font
                 forWidth:(CGFloat)width
              lineSpacing:(CGFloat)lineSpacing
            numberOfLines:(NSInteger)numberOfLines
            lineBreakMode:(NSLineBreakMode)lineBreakMode
                alignment:(NSTextAlignment)alignment;


- (NSMutableAttributedString *)dk_attributedStringWithFont:(UIFont *)font
                                                  forWidth:(CGFloat)width
                                                     color:(UIColor *)color
                                               lineSpacing:(CGFloat)lineSpacing;


- (NSMutableAttributedString *)dk_attributedStringWithFont:(UIFont *)font
                                                  forWidth:(CGFloat)width
                                                     color:(UIColor *)color
                                               lineSpacing:(CGFloat)lineSpacing
                                             lineBreakMode:(NSLineBreakMode)lineBreakMode;


- (NSMutableAttributedString *)dk_attributedStringWithFont:(UIFont *)font
                                                  forWidth:(CGFloat)width
                                                     color:(UIColor *)color
                                               lineSpacing:(CGFloat)lineSpacing
                                             lineBreakMode:(NSLineBreakMode)lineBreakMode
                                                 alignment:(NSTextAlignment)alignment;

@end


@interface NSAttributedString (DKSize)

- (CGSize)dk_sizeWithWidth:(CGFloat)width numberOfLines:(NSInteger)numberOfLines;

@end






