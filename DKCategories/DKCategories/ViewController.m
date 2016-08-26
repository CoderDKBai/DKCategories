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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *btn = [[UILabel alloc] init];
    btn.userInteractionEnabled = YES;
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    btn.extraHitTestEdgeInsets = UIEdgeInsetsMake(100, 100, 100, 100);
//    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [btn addGestureRecognizer:tap];
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

@end
