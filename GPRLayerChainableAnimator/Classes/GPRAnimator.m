//
//  GPRAnimator.m
//  GPRLayerChainableAnimator
//
//  Created by anthann on 2018/3/11.
//  Copyright © 2018年 anthann. All rights reserved.
//

#import "GPRAnimator.h"

@interface GPRAnimator () <CAAnimationDelegate>

@property (strong, nonatomic) NSMutableArray <GPRAnimation *>*animations;
@property (weak, nonatomic) CALayer *layer;
@property (assign, nonatomic) NSInteger index;

@end

@implementation GPRAnimator

- (instancetype)initWithLayer:(CALayer *)layer {
    self = [super init];
    if (self) {
        _layer = layer;
        _animations = [NSMutableArray array];
    }
    return self;
}

- (GPRAnimation *)basicAnimation {
    GPRAnimation *animation = [[GPRAnimation alloc] initWithSubType:GPRAnimationSubTypeBasic];
    [self.animations addObject:animation];
    return animation;
}

- (GPRAnimation *)keyFrameAnimation {
    GPRAnimation *animation = [[GPRAnimation alloc] initWithSubType:GPRAnimationSubTypeKeyFrame];
    [self.animations addObject:animation];
    return animation;
}

- (GPRAnimation *)propertyAnimation {
    GPRAnimation *animation = [[GPRAnimation alloc] initWithSubType:GPRAnimationSubTypeProperty];
    [self.animations addObject:animation];
    return animation;
}

- (GPRAnimation *)springAnimation {
    GPRAnimation *animation = [[GPRAnimation alloc] initWithSubType:GPRAnimationSubTypeSpring];
    [self.animations addObject:animation];
    return animation;
}

- (GPRAnimation *)transition {
    GPRAnimation *animation = [[GPRAnimation alloc] initWithSubType:GPRAnimationSubTypeTransition];
    [self.animations addObject:animation];
    return animation;
}

- (void)commitAnimation {
    [self performAnimationAtIndex:0];
}

- (void)performAnimationAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.animations.count) {
        return;
    }
    GPRAnimation *animation = self.animations[index];
    CAAnimation *realAnimation = animation.animation;
    realAnimation.delegate = self;
    [self.layer addAnimation:realAnimation forKey:nil];
    if ([realAnimation isKindOfClass:[CATransition class]]) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [self.layer addAnimation:realAnimation forKey:nil];
        GPRTransitionBlock block = [animation.transitionBlock copy];
        if (block) {
            block();
        }
        self.animations[index].transitionBlock = nil;
    }
    self.index = index + 1;
};

#pragma mark - CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        if (self.index >= 0 && self.index < self.animations.count) {
            [self performAnimationAtIndex:self.index];
        } else {
            [self.animations removeAllObjects];
        }
    }
}

@end
