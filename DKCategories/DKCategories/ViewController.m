//
//  ViewController.m
//  DKCategories
//
//  Created by 柏道坤 on 15/12/29.
//  Copyright © 2015年 CoderDKBai. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+DKAdd.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 100, 45, 80);
    
    [btn setImage:[UIImage imageNamed:@"dynamic_publish_cancel"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:@"测试按钮" forState:UIControlStateNormal];
    btn.titleLabel.backgroundColor = [UIColor greenColor];
    btn.backgroundColor = [UIColor redColor];
    [btn layoutButtonWithEdgeInsetsStyle:UIButtonEdgeInsetsStyleImageTop imageTitleSpace:5];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClick:(id)sender {
    NSLog(@"-----");
}

@end
