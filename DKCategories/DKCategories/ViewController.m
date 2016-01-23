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
    // Do any additional setup after loading the view, typically from a nib.
    _btn.expandHitEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClick:(id)sender {
    NSLog(@"-----");
}

@end
