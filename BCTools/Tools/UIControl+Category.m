//
//  UIControl+Category.m
//  BCTools
//
//  Created by 刘勇强 on 2017/8/2.
//  Copyright © 2017年 刘勇强. All rights reserved.
//

#import "UIControl+Category.h"

#import <objc/runtime.h>

static void *UIButtonCCCommandKey = &UIButtonCCCommandKey;

@implementation UIControl (Category)

- (BCCommand *)bc_command {
    return objc_getAssociatedObject(self, UIButtonCCCommandKey);
}

- (void)setBc_command:(BCCommand *)bc_command {
    if (bc_command == nil) return;
    
    objc_setAssociatedObject(self, UIButtonCCCommandKey, bc_command, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self hx_hijackActionAndTargetIfNeeded];
}

- (void)hx_hijackActionAndTargetIfNeeded {
    SEL hijackSelector = @selector(hj_commandPerformAction:);
    
    for (NSString *selector in [self actionsForTarget:self forControlEvent:UIControlEventTouchUpInside]) {
        if (hijackSelector == NSSelectorFromString(selector)) {
            return;
        }
    }
    
    [self addTarget:self action:hijackSelector forControlEvents:UIControlEventTouchUpInside];
}

- (void)hj_commandPerformAction:(id)sender {
    [self.bc_command execute:sender];
}

@end
