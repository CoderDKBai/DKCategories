//
//  ViewController.m
//  DKCategories
//
//  Created by 柏道坤 on 15/12/29.
//  Copyright © 2015年 CoderDKBai. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+DKAdd.h"
#import "UIView+DKAssistance.h"
#import "NSString+DKAssistance.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIFont *font = [UIFont systemFontOfSize:14.0f];
//    CGFloat width = 300.0f;
//    NSString *str1 = @"这是一行文字";
//    NSString *str2 = @"你可以在启动电脑的时候自动清空Temp文件夹中的文件。方法是选择“开始｜运行”，键入“sysedit”，单击“确定”，启动“系统配置编辑程序”，进入“c:＼autoexec.bat”窗口，在文本末尾加入：deltree /y C:＼Windows＼Temp，保存并退出。此后，在你每次启动计算机后就会得到一个空白的Temp文件夹了";
//    
//    CGSize size2 = [str1 dk_sizeWithFont:font forWidth:width lineSpacing:5 numberOfLines:2 lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentLeft];
//    CGSize size22 = [str1 sizeForFont:font size:CGSizeMake(width, CGFLOAT_MAX) mode:NSLineBreakByWordWrapping];
//    
//    NSLog(@"--");
    [self testStr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClick:(id)sender {
    NSLog(@"-----");
}

- (void)click {
    NSLog(@"点击了按钮");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
NSLog(@"----fdsafdsf-");
}

- (void)testStr {
    NSString *testStr = @"这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字";
    UIFont *font = [UIFont systemFontOfSize:15.0f];
    CGFloat width = 350.0f;
    NSDate *startTime = [NSDate date];
    for (NSInteger i = 0; i < 1000; i++) {
        //        NSMutableAttributedString *att = [testStr xdw_attributedStringWithFontSize:15.0f maxWidth:375.0f color:[UIColor redColor] lineSpacing:5.0f alignment:NSTextAlignmentNatural lineBreakMode:NSLineBreakByTruncatingTail];
        
        CGSize size = [testStr dk_sizeWithFont:font forWidth:width lineSpacing:5 numberOfLines:10 lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentLeft];
       
        
    }
    NSLog(@"Time: %f", -[startTime timeIntervalSinceNow]);
    
    NSDate *startTime1 = [NSDate date];
    for (NSInteger i = 0; i < 1000; i++) {
        //        NSMutableAttributedString *att = [testStr xdw_attributedStringWithFontSize:15.0f maxWidth:375.0f color:[UIColor redColor] lineSpacing:5.0f alignment:NSTextAlignmentNatural lineBreakMode:NSLineBreakByTruncatingTail];
        
        CGSize size = [testStr dk_sizeWithFont:font forWidth:width lineSpacing:5 numberOfLines:10 lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentLeft];
       
    }
    NSLog(@"Time: %f", -[startTime1 timeIntervalSinceNow]);
}

@end
