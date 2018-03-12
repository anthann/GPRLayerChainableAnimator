//
//  GPRAnimation.m
//  GPRLayerChainableAnimator
//
//  Created by anthann on 2018/3/11.
//  Copyright © 2018年 anthann. All rights reserved.
//

#import "GPRAnimation.h"

@interface GPRAnimation ()

@end

@implementation GPRAnimation

- (instancetype)initWithSubType:(GPRAnimationSubType)subType {
    self = [super init];
    if (self) {
        switch (subType) {
            case GPRAnimationSubTypeBasic:
                self.animation = [CABasicAnimation animation];
                break;
            case GPRAnimationSubTypeKeyFrame:
                self.animation = [CAKeyframeAnimation animation];
                break;
            case GPRAnimationSubTypeProperty:
                self.animation = [CAPropertyAnimation animation];
                break;
            case GPRAnimationSubTypeTransition:
                self.animation = [CATransition animation];
                break;
            case GPRAnimationSubTypeSpring:
                if (@available(iOS 9.0, *)) {
                    self.animation = [CASpringAnimation animation];
                } else {
                    // abort?
                    self.animation = [CAAnimation animation];
                }
                break;
        };
    }
    return self;
}

- (GPRAnimation * (^)(CAMediaTimingFunction *value))timingFunction {
    return ^GPRAnimation *(CAMediaTimingFunction *value) {
        self.animation.timingFunction = value;
        return self;
    };
}

- (GPRAnimation * (^)(CFTimeInterval value))duration {
    return ^GPRAnimation *(CFTimeInterval value) {
        self.animation.duration = value;
        return self;
    };
}

- (GPRAnimation * (^)(BOOL value))removedOnCompletion {
    return ^GPRAnimation *(BOOL value) {
        self.animation.removedOnCompletion = value;
        return self;
    };
}

- (GPRAnimation * (^)(id value))fillMode {
    return ^GPRAnimation *(id value) {
        self.animation.fillMode = value;
        return self;
    };
}

- (GPRAnimation * (^)(float value))repeatCount {
    return ^GPRAnimation *(float value) {
        self.animation.repeatCount = value;
        return self;
    };
}

- (GPRAnimation * (^)(CFTimeInterval value))beginTime {
    return ^GPRAnimation *(CFTimeInterval value) {
        self.animation.beginTime = value;
        return self;
    };
}

- (GPRAnimation * (^)(float value))speed {
    return ^GPRAnimation *(float value) {
        self.animation.speed = value;
        return self;
    };
}

- (GPRAnimation * (^)(CFTimeInterval value))timeOffset {
    return ^GPRAnimation *(CFTimeInterval value) {
        self.animation.timeOffset = value;
        return self;
    };
}

- (GPRAnimation * (^)(CFTimeInterval value))repeatDuration {
    return ^GPRAnimation *(CFTimeInterval value) {
        self.animation.repeatDuration = value;
        return self;
    };
}

- (GPRAnimation *)autoreverses {
    self.animation.autoreverses = YES;
    return self;
}

- (GPRAnimation *)fillModeForwards {
    self.animation.removedOnCompletion = NO;
    self.animation.fillMode = kCAFillModeForwards;
    return self;
}

#pragma mark - Property Animation

- (GPRAnimation * (^)(NSString *value))keyPath {
    return ^GPRAnimation *(NSString *value) {
        if (![self.animation isKindOfClass:[CAPropertyAnimation class]]) {
            return self;
        }
        CAPropertyAnimation *a =(CAPropertyAnimation *)self.animation;
        a.keyPath = value;
        return self;
    };
}

- (GPRAnimation *)additive {
    if (![self.animation isKindOfClass:[CAPropertyAnimation class]]) {
        return self;
    }
    CAPropertyAnimation *a =(CAPropertyAnimation *)self.animation;
    a.additive = YES;
    return self;
}
- (GPRAnimation *)cumulative {
    if (![self.animation isKindOfClass:[CAPropertyAnimation class]]) {
        return self;
    }
    CAPropertyAnimation *a =(CAPropertyAnimation *)self.animation;
    a.cumulative = YES;
    return self;
}

- (GPRAnimation * (^)(CAValueFunction *value))valueFunction {
    return ^GPRAnimation *(CAValueFunction *value) {
        if (![self.animation isKindOfClass:[CAPropertyAnimation class]]) {
            return self;
        }
        CAPropertyAnimation *a =(CAPropertyAnimation *)self.animation;
        a.valueFunction = value;
        return self;
    };
}

#pragma mark - Basic Animation

- (GPRAnimation * (^)(id value))fromValue {
    return ^GPRAnimation *(id value) {
        if (![self.animation isKindOfClass:[CABasicAnimation class]]) {
            return self;
        }
        CABasicAnimation *a =(CABasicAnimation *)self.animation;
        a.fromValue = value;
        return self;
    };
}
- (GPRAnimation * (^)(id value))toValue {
    return ^GPRAnimation *(id value) {
        if (![self.animation isKindOfClass:[CABasicAnimation class]]) {
            return self;
        }
        CABasicAnimation *a =(CABasicAnimation *)self.animation;
        a.toValue = value;
        return self;
    };
}

- (GPRAnimation * (^)(id value))byValue {
    return ^GPRAnimation *(id value) {
        if (![self.animation isKindOfClass:[CABasicAnimation class]]) {
            return self;
        }
        CABasicAnimation *a =(CABasicAnimation *)self.animation;
        a.byValue = value;
        return self;
    };
}

#pragma mark - Keyframe Animation

- (GPRAnimation * (^)(NSArray *value))values {
    return ^GPRAnimation *(NSArray * value) {
        if (![self.animation isKindOfClass:[CAKeyframeAnimation class]]) {
            return self;
        }
        CAKeyframeAnimation *a =(CAKeyframeAnimation *)self.animation;
        a.values = value;
        return self;
    };
}

- (GPRAnimation * (^)(CGPathRef value))path {
    return ^GPRAnimation *(CGPathRef value) {
        if (![self.animation isKindOfClass:[CAKeyframeAnimation class]]) {
            return self;
        }
        CAKeyframeAnimation *a =(CAKeyframeAnimation *)self.animation;
        a.path = value;
        return self;
    };
}

- (GPRAnimation * (^)(NSArray<NSNumber *> *value))keyTimes {
    return ^GPRAnimation *(NSArray<NSNumber *> *value) {
        if (![self.animation isKindOfClass:[CAKeyframeAnimation class]]) {
            return self;
        }
        CAKeyframeAnimation *a =(CAKeyframeAnimation *)self.animation;
        a.keyTimes = value;
        return self;
    };
}

- (GPRAnimation * (^)(NSArray<CAMediaTimingFunction *> *value))timingFunctions {
    return ^GPRAnimation *(NSArray<CAMediaTimingFunction *> *value) {
        if (![self.animation isKindOfClass:[CAKeyframeAnimation class]]) {
            return self;
        }
        CAKeyframeAnimation *a =(CAKeyframeAnimation *)self.animation;
        a.timingFunctions = value;
        return self;
    };
}

- (GPRAnimation * (^)(NSString *value))calculationMode {
    return ^GPRAnimation *(NSString *value) {
        if (![self.animation isKindOfClass:[CAKeyframeAnimation class]]) {
            return self;
        }
        CAKeyframeAnimation *a =(CAKeyframeAnimation *)self.animation;
        a.calculationMode = value;
        return self;
    };
}

- (GPRAnimation * (^)(NSArray<NSNumber *> *value))tensionValues {
    return ^GPRAnimation *(NSArray<NSNumber *> *value) {
        if (![self.animation isKindOfClass:[CAKeyframeAnimation class]]) {
            return self;
        }
        CAKeyframeAnimation *a =(CAKeyframeAnimation *)self.animation;
        a.tensionValues = value;
        return self;
    };
}

- (GPRAnimation * (^)(NSArray<NSNumber *> *value))continuityValues {
    return ^GPRAnimation *(NSArray<NSNumber *> *value) {
        if (![self.animation isKindOfClass:[CAKeyframeAnimation class]]) {
            return self;
        }
        CAKeyframeAnimation *a =(CAKeyframeAnimation *)self.animation;
        a.continuityValues = value;
        return self;
    };
}

- (GPRAnimation * (^)(NSArray<NSNumber *> *value))biasValues {
    return ^GPRAnimation *(NSArray<NSNumber *> *value) {
        if (![self.animation isKindOfClass:[CAKeyframeAnimation class]]) {
            return self;
        }
        CAKeyframeAnimation *a =(CAKeyframeAnimation *)self.animation;
        a.biasValues = value;
        return self;
    };
}

- (GPRAnimation * (^)(NSString *value))rotationMode {
    return ^GPRAnimation *(NSString *value) {
        if (![self.animation isKindOfClass:[CAKeyframeAnimation class]]) {
            return self;
        }
        CAKeyframeAnimation *a =(CAKeyframeAnimation *)self.animation;
        a.rotationMode = value;
        return self;
    };
}

#pragma mark - Spring Animation
- (GPRAnimation * (^)(CGFloat value))mass {
    return ^GPRAnimation *(CGFloat value) {
        if (@available(iOS 9.0, *)) {
            if (![self.animation isKindOfClass:[CASpringAnimation class]]) {
                return self;
            }
            CASpringAnimation *a =(CASpringAnimation *)self.animation;
            a.mass = value;
            return self;
        } else {
            return self;
        }
    };
}
- (GPRAnimation * (^)(CGFloat value))stiffness {
    return ^GPRAnimation *(CGFloat value) {
        if (@available(iOS 9.0, *)) {
            if (![self.animation isKindOfClass:[CASpringAnimation class]]) {
                return self;
            }
            CASpringAnimation *a =(CASpringAnimation *)self.animation;
            a.stiffness = value;
            return self;
        } else {
            return self;
        }
    };
}

- (GPRAnimation * (^)(CGFloat value))damping {
    return ^GPRAnimation *(CGFloat value) {
        if (@available(iOS 9.0, *)) {
            if (![self.animation isKindOfClass:[CASpringAnimation class]]) {
                return self;
            }
            CASpringAnimation *a =(CASpringAnimation *)self.animation;
            a.damping = value;
            return self;
        } else {
            return self;
        }
    };
}

- (GPRAnimation * (^)(CGFloat value))initialVelocity {
    return ^GPRAnimation *(CGFloat value) {
        if (@available(iOS 9.0, *)) {
            if (![self.animation isKindOfClass:[CASpringAnimation class]]) {
                return self;
            }
            CASpringAnimation *a =(CASpringAnimation *)self.animation;
            a.initialVelocity = value;
            return self;
        } else {
            return self;
        }
    };
}

#pragma mark - Transition

- (GPRAnimation * (^)(NSString *value))type {
    return ^GPRAnimation *(NSString *value) {
        if (![self.animation isKindOfClass:[CATransition class]]) {
            return self;
        }
        CATransition *a =(CATransition *)self.animation;
        a.type = value;
        return self;
    };
}

- (GPRAnimation * (^)(NSString *value))subtype {
    return ^GPRAnimation *(NSString *value) {
        if (![self.animation isKindOfClass:[CATransition class]]) {
            return self;
        }
        CATransition *a =(CATransition *)self.animation;
        a.subtype = value;
        return self;
    };
}

- (GPRAnimation * (^)(CGFloat value))startProgress {
    return ^GPRAnimation *(CGFloat value) {
        if (![self.animation isKindOfClass:[CATransition class]]) {
            return self;
        }
        CATransition *a =(CATransition *)self.animation;
        a.startProgress = value;
        return self;
    };
}

- (GPRAnimation * (^)(CGFloat value))endProgress {
    return ^GPRAnimation *(CGFloat value) {
        if (![self.animation isKindOfClass:[CATransition class]]) {
            return self;
        }
        CATransition *a =(CATransition *)self.animation;
        a.endProgress = value;
        return self;
    };
}

- (GPRAnimation * (^)(GPRTransitionBlock value))transition {
    return ^GPRAnimation *(GPRTransitionBlock value) {
        if (![self.animation isKindOfClass:[CATransition class]]) {
            return self;
        }
        self.transitionBlock = value;
        return self;
    };
}

@end
