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
        };
    }
    return self;
}

- (GPRAnimation * (^)(CAMediaTimingFunction *value))timingFunction {
    return ^GPRAnimation *(id value) {
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

- (GPRAnimation * (^)(id value))keyPath {
    return ^GPRAnimation *(id value) {
        if (![self.animation isKindOfClass:[CAPropertyAnimation class]]) {
            return self;
        }
        CAPropertyAnimation *a =(CAPropertyAnimation *)self.animation;
        a.keyPath = value;
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



@end
