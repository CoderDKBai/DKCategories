//
//  NSString+DKAssistance.m
//  DKCategories
//
//  Created by 柏道坤 on 2016/9/28.
//  Copyright © 2016年 CoderDKBai. All rights reserved.
//

#import "NSString+DKAssistance.h"

@implementation NSString (DKAssistance)

- (CGSize)dk_sizeWithFont:(UIFont *)font
                 forWidth:(CGFloat)width
              lineSpacing:(CGFloat)lineSpacing
            numberOfLines:(NSInteger)numberOfLines {
    
    return [self dk_sizeWithFont:font forWidth:width lineSpacing:lineSpacing numberOfLines:numberOfLines lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentLeft];
}

- (CGSize)dk_sizeWithFont:(UIFont *)font
                 forWidth:(CGFloat)width
              lineSpacing:(CGFloat)lineSpacing
            numberOfLines:(NSInteger)numberOfLines
            lineBreakMode:(NSLineBreakMode)lineBreakMode
                alignment:(NSTextAlignment)alignment {
    
    if (!self || [self isEqualToString:@""]) {
        return CGSizeZero;
    }
    // 分两种情况：1、指定最大行数 2、未指定最大行数
    if (!font) font = [UIFont systemFontOfSize:13.0f];
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    if (numberOfLines != 0) { // 指定了最大行数
        NSMutableAttributedString *attributedText = [self dk_attributedStringWithFont:font forWidth:width color:[UIColor blackColor] lineSpacing:lineSpacing lineBreakMode:lineBreakMode alignment:alignment];
        
        UILabel *tempLabel = [[UILabel alloc] init];
        tempLabel.attributedText = attributedText;
        tempLabel.numberOfLines = numberOfLines;
        
        CGSize showSize = [tempLabel sizeThatFits:size];
        return CGSizeMake(ceil(showSize.width), ceil(showSize.height));
    } else {
        NSString *singleRowString = @"占位temp😊";
        CGSize singleRowSize = [singleRowString sizeWithAttributes:@{NSFontAttributeName:font}];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = lineSpacing;
        paragraphStyle.lineBreakMode = lineBreakMode;
        paragraphStyle.alignment = alignment;
        
        NSDictionary *attributes = @{NSFontAttributeName:font,
                                     NSParagraphStyleAttributeName:paragraphStyle};
        CGSize selfSize =[self boundingRectWithSize:size
                                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                         attributes:attributes context:nil].size;
        if (selfSize.height - lineSpacing <= ceil(singleRowSize.height)) {
            return CGSizeMake(ceil(selfSize.width), ceil(singleRowSize.height));
        }
        return CGSizeMake(ceil(selfSize.width), ceil(selfSize.height));
    }
}

- (NSMutableAttributedString *)dk_attributedStringWithFont:(UIFont *)font
                                                  forWidth:(CGFloat)width
                                                     color:(UIColor *)color
                                               lineSpacing:(CGFloat)lineSpacing {
    return [self dk_attributedStringWithFont:font forWidth:width color:color lineSpacing:lineSpacing lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentLeft];
}


- (NSMutableAttributedString *)dk_attributedStringWithFont:(UIFont *)font
                                                  forWidth:(CGFloat)width
                                                     color:(UIColor *)color
                                               lineSpacing:(CGFloat)lineSpacing
                                             lineBreakMode:(NSLineBreakMode)lineBreakMode {
    return [self dk_attributedStringWithFont:font forWidth:width color:color lineSpacing:lineSpacing lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentLeft];
}


- (NSMutableAttributedString *)dk_attributedStringWithFont:(UIFont *)font
                                                  forWidth:(CGFloat)width
                                                     color:(UIColor *)color
                                               lineSpacing:(CGFloat)lineSpacing
                                             lineBreakMode:(NSLineBreakMode)lineBreakMode
                                                 alignment:(NSTextAlignment)alignment {
    if (!self || [self isEqualToString:@""]) {
        return [[NSMutableAttributedString alloc] initWithString:@""];
    }
    
    if (!font) font = [UIFont systemFontOfSize:13.0f];
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    NSString *singleRowString = @"占位temp😊";
    NSDictionary *temp = @{NSFontAttributeName:font};
    
    CGSize singleRowSize = [singleRowString sizeWithAttributes:temp];
    CGSize selfSize =[self boundingRectWithSize:size
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:temp context:nil].size;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 行间距(单行和多行设置不一样，如果判断是单行显示，间距设为0)
    paragraphStyle.lineSpacing = selfSize.height > ceil(singleRowSize.height) ? lineSpacing : 0.0;
    paragraphStyle.lineBreakMode = lineBreakMode;
    paragraphStyle.alignment = alignment;
    
    NSDictionary *attributes = @{NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:color,
                                 NSParagraphStyleAttributeName:paragraphStyle};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
    return attributedString;
}

@end

@implementation NSAttributedString (DKSize)

- (CGSize)dk_sizeWithWidth:(CGFloat)width numberOfLines:(NSInteger)numberOfLines {
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    UILabel *tempLabel = [[UILabel alloc] init];
    tempLabel.attributedText = self;
    tempLabel.numberOfLines = numberOfLines;
    
    CGSize showSize = [tempLabel sizeThatFits:size];
    return CGSizeMake(ceil(showSize.width), ceil(showSize.height));
}

@end
