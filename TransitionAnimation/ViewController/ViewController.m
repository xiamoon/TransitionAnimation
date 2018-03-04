//
//  ViewController.m
//  TransitionAnimation
//
//  Created by 李乾 on 2018/3/2.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"
#import "TransitionDelegater.h"

@interface ViewController ()
@property (nonatomic, strong) TransitionDelegater *transitionDelegater;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    _transitionDelegater = [TransitionDelegater new];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Click me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked:(UIButton *)sender {
    ModalViewController *mvc = [ModalViewController new];
    mvc.transitioningDelegate = _transitionDelegater;
    [self presentViewController:mvc animated:YES completion:nil];
}


@end

//1月6号：00
//2月份：47
//现在：63
