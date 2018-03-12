//
//  GPRAnimation.h
//  GPRLayerChainableAnimator
//
//  Created by anthann on 2018/3/11.
//  Copyright © 2018年 anthann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, GPRAnimationSubType) {
    GPRAnimationSubTypeBasic = 0,
    GPRAnimationSubTypeKeyFrame = 1,
    GPRAnimationSubTypeProperty = 2,
    GPRAnimationSubTypeSpring = 3,
    GPRAnimationSubTypeTransition = 4,
};

typedef void (^GPRTransitionBlock)(void);

@interface GPRAnimation : NSObject

@property (strong, nonatomic) CAAnimation *animation;
@property (copy, nonatomic) GPRTransitionBlock transitionBlock;

- (instancetype)initWithSubType:(GPRAnimationSubType)subType;

- (GPRAnimation * (^)(CAMediaTimingFunction *value))timingFunction;
- (GPRAnimation * (^)(CFTimeInterval value))duration;
- (GPRAnimation * (^)(BOOL value))removedOnCompletion;
- (GPRAnimation * (^)(id value))fillMode;
- (GPRAnimation * (^)(float value))repeatCount;
- (GPRAnimation * (^)(CFTimeInterval value))beginTime;
- (GPRAnimation * (^)(float value))speed;
- (GPRAnimation * (^)(CFTimeInterval value))timeOffset;
- (GPRAnimation * (^)(CFTimeInterval value))repeatDuration;
- (GPRAnimation *)autoreverses;
- (GPRAnimation *)fillModeForwards;

// Property Animation
- (GPRAnimation * (^)(NSString *value))keyPath;
- (GPRAnimation *)additive;
- (GPRAnimation *)cumulative;
- (GPRAnimation * (^)(CAValueFunction *value))valueFunction;

// Basic Animation
- (GPRAnimation * (^)(id value))fromValue;
- (GPRAnimation * (^)(id value))toValue;
- (GPRAnimation * (^)(id value))byValue;

// Keyframe Animation
- (GPRAnimation * (^)(NSArray *value))values;
- (GPRAnimation * (^)(CGPathRef value))path;
- (GPRAnimation * (^)(NSArray<NSNumber *> *value))keyTimes;
- (GPRAnimation * (^)(NSArray<CAMediaTimingFunction *> *value))timingFunctions;
- (GPRAnimation * (^)(NSString *value))calculationMode;
- (GPRAnimation * (^)(NSArray<NSNumber *> *value))tensionValues;
- (GPRAnimation * (^)(NSArray<NSNumber *> *value))continuityValues;
- (GPRAnimation * (^)(NSArray<NSNumber *> *value))biasValues;
- (GPRAnimation * (^)(NSString *value))rotationMode;

// Spring Animation
- (GPRAnimation * (^)(CGFloat value))mass;
- (GPRAnimation * (^)(CGFloat value))stiffness;
- (GPRAnimation * (^)(CGFloat value))damping;
- (GPRAnimation * (^)(CGFloat value))initialVelocity;

// Transition Animation
- (GPRAnimation * (^)(NSString *value))type;
- (GPRAnimation * (^)(NSString *value))subtype;
- (GPRAnimation * (^)(CGFloat value))startProgress;
- (GPRAnimation * (^)(CGFloat value))endProgress;
- (GPRAnimation * (^)(GPRTransitionBlock value))transition;

@end
