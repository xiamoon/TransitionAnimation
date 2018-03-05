//
//  DismissInteraction.m
//  TransitionAnimation
//
//  Created by 李乾 on 2018/3/3.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "DismissInteraction.h"

@interface DismissInteraction ()
@property (nonatomic, strong) UIViewController *dismissedVC;
@end

@implementation DismissInteraction

- (instancetype)initWithDismissedVC:(UIViewController *)dismissedVC {
    self = [super init];
    if (self) {
        _dismissedVC = dismissedVC;
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [dismissedVC.view addGestureRecognizer:pan];
    }
    return self;
}


#pragma mark - UIViewControllerInteractiveTransitioning
// percentComplete代表完成度。

// 这个表示在cancel或者finish时，视图恢复原状或者完全dismiss的速度。
- (CGFloat)completionSpeed {
    return 0.4;
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint translation = [pan translationInView:pan.view];
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGFloat percent = translation.y / screenBounds.size.height;
    percent = fmin(fmax(percent, 0.0), 1.0);
    NSLog(@"translation: %.2f, percent: %.2f", translation.y, percent);
    if (pan.state == UIGestureRecognizerStateBegan) {
        [_dismissedVC dismissViewControllerAnimated:YES completion:nil];
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        [self updateInteractiveTransition:percent];
    }else if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled) {
        if (percent < 0.5 || pan.state == UIGestureRecognizerStateCancelled) {
            [self cancelInteractiveTransition];
        }else {
            [self finishInteractiveTransition];
        }
    }
}

@end
