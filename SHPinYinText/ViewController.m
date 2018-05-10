//
//  ViewController.m
//  SHPinYinText
//
//  Created by HaoSun on 2018/5/10.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController.h"
#import "SHPinYinTextView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    SHPinYinTextView *v = [[SHPinYinTextView alloc] init];
    v.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 500);
    v.contentString = @"把两个或两个以上的音素结合起来成为一个复合的音。丁玲 《给孩子们·途中》：“ 小平 他说他已经能够当记录了。他们是学罗马字拼音。”";
    [self.view addSubview:v];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
