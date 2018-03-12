//
//  CALayer+GPRAnimation.m
//  GPRLayerChainableAnimator
//
//  Created by anthann on 2018/3/11.
//  Copyright © 2018年 anthann. All rights reserved.
//

#import "CALayer+GPRAnimation.h"

@implementation CALayer (GPRAnimation)

- (void)gpr_makeAnimations:(void(^)(GPRAnimator *))animations {
    GPRAnimator *animator = [[GPRAnimator alloc] initWithLayer:self];
    animations(animator);
    [animator commitAnimation];
}

@end
