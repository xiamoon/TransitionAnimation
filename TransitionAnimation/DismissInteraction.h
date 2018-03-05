//
//  DismissInteraction.h
//  TransitionAnimation
//
//  Created by 李乾 on 2018/3/3.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DismissInteraction : UIPercentDrivenInteractiveTransition // NSObject <UIViewControllerInteractiveTransitioning>
// 父类遵循了协议，所有子类也同时遵循。

- (instancetype)initWithDismissedVC:(UIViewController *)dismissedVC;

@end
