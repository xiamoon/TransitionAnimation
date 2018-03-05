//
//  TransitionDelegater.m
//  TransitionAnimation
//
//  Created by 李乾 on 2018/3/2.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "TransitionDelegater.h"
#import "BouncePresentAnimation.h"
#import "DismissAnimation.h"
#import "DismissInteraction.h"

@interface TransitionDelegater ()
@property (nonatomic, strong) UIViewController *presentedVC;
@property (nonatomic, strong) DismissInteraction *dismissInteraction;
@end

@implementation TransitionDelegater

- (void)setPresentedVC:(UIViewController *)presentedVC {
    _presentedVC = presentedVC;
    _dismissInteraction = [[DismissInteraction alloc] initWithDismissedVC:presentedVC];
}

// Present时的动画
// 赋值给ModalViewController的transitionDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.presentedVC = presented;
    return [BouncePresentAnimation new];
}

// Dismiss时的动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [DismissAnimation new];
}

// Present时的交互
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}

// Dismiss时的交互，由手势交互引起的dismiss
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return _dismissInteraction;
}


- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return nil;
}


@end
