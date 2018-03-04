//
//  DismissAnimation.m
//  TransitionAnimation
//
//  Created by 李乾 on 2018/3/2.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "DismissAnimation.h"

@implementation DismissAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGRect finalFrame = CGRectOffset(initialFrame, 0, screenBounds.size.height-200);
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^{
        fromVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
