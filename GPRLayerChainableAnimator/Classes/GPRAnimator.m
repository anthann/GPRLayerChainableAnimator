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

- (void)commitAnimation {
    if (self.animations.count == 0) {
        self.index = -1;
        return;
    }
    CAAnimation *realAnimation = self.animations.firstObject.animation;
    realAnimation.delegate = self;
    self.index = 0;
    [self.layer addAnimation:realAnimation forKey:nil];
}

#pragma mark - CAAnimationDelegate


- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        if (self.index < self.animations.count - 1) {
            CAAnimation *realAnimation = self.animations[self.index + 1].animation;
            realAnimation.delegate = self;
            self.index += 1;
            [self.layer addAnimation:realAnimation forKey:nil];
        } else {
            [self.animations removeAllObjects];
        }
    }
}

@end
