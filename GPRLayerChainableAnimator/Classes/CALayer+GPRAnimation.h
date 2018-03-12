//
//  CALayer+GPRAnimation.h
//  GPRLayerChainableAnimator
//
//  Created by anthann on 2018/3/11.
//  Copyright © 2018年 anthann. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "GPRAnimator.h"
#import "GPRAnimation.h"

@interface CALayer (GPRAnimation)

- (void)gpr_makeAnimations:(void(^)(GPRAnimator *))animations;

@end
