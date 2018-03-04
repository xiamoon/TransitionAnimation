//
//  BouncePresentAnimation.m
//  TransitionAnimation
//
//  Created by 李乾 on 2018/3/2.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "BouncePresentAnimation.h"

// 决定转场动画怎么进行

@implementation BouncePresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    CGRect screenBounds = [[UIScreen mainScreen] bounds];

//    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
//    UIView *screenshotForFromView = [fromView snapshotViewAfterScreenUpdates:NO];
//    screenshotForFromView.frame = CGRectOffset(screenBounds, 0, 100);
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
    
    UIView *containerView = [transitionContext containerView];
//    containerView.backgroundColor = [UIColor greenColor];
//    [containerView addSubview:screenshotForFromView];
    
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        // 这一句代码是必须的，只有编辑为complete时，页面才能继续交互。
        // 当调用这一句代码之后，fromVc就不在页面层次里了，所以背景一般会变黑。
        [transitionContext completeTransition:YES];
    }];
}

@end
