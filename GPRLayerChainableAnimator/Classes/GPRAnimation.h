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
    GPRAnimationSubTypeProperty = 2
};

@interface GPRAnimation : NSObject

@property (strong, nonatomic) CAAnimation *animation;

- (instancetype)initWithSubType:(GPRAnimationSubType)subType;

- (GPRAnimation * (^)(CAMediaTimingFunction *value))timingFunction;
- (GPRAnimation * (^)(CFTimeInterval value))duration;
- (GPRAnimation * (^)(BOOL value))removedOnCompletion;
- (GPRAnimation * (^)(id value))fillMode;
- (GPRAnimation * (^)(float value))repeatCount;
- (GPRAnimation *)autoreverses;
- (GPRAnimation *)fillModeForwards;

// Property Animation
- (GPRAnimation * (^)(id value))keyPath;

// Basic Animation
- (GPRAnimation * (^)(id value))fromValue;
- (GPRAnimation * (^)(id value))toValue;
- (GPRAnimation * (^)(id value))byValue;

@end
