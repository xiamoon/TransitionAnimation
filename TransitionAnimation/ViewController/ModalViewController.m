//
//  ModalViewController.m
//  TransitionAnimation
//
//  Created by 李乾 on 2018/3/2.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "ModalViewController.h"
#import "ModalViewController2.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Present me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(80.0, 400.0, 160.0, 40.0);
    [button2 setTitle:@"Dismiss me" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonClicked2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)buttonClicked:(UIButton *)sender {
    ModalViewController2*vc = [ModalViewController2 new];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)buttonClicked2:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
