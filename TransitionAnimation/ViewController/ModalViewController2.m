//
//  ModalViewController2.m
//  TransitionAnimation
//
//  Created by 李乾 on 2018/3/3.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "ModalViewController2.h"

@interface ModalViewController2 ()

@end

@implementation ModalViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(80.0, 400.0, 160.0, 40.0);
    [button2 setTitle:@"Dismiss me" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonClicked2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)buttonClicked2:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
