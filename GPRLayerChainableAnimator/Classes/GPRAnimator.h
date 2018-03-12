//
//  GPRAnimator.h
//  GPRLayerChainableAnimator
//
//  Created by anthann on 2018/3/11.
//  Copyright © 2018年 anthann. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GPRAnimation.h"

@interface GPRAnimator : NSObject

- (instancetype)initWithLayer:(CALayer *)layer;
- (GPRAnimation *)basicAnimation;
//- (GPRAnimation *)keyFrameAnimation;
//- (GPRAnimation *)propertyAnimation;

- (void)commitAnimation;

@end
