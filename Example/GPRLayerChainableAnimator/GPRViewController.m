//
//  GPRViewController.m
//  GPRLayerChainableAnimator
//
//  Created by anthann on 03/12/2018.
//  Copyright (c) 2018 anthann. All rights reserved.
//

#import "GPRViewController.h"
#import "CALayer+GPRAnimation.h"

@interface GPRViewController ()

@property (strong, nonatomic) CALayer *demoLayer;

@end

@implementation GPRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.demoLayer = [CALayer layer];
    self.demoLayer.frame = CGRectMake(100, 100, 200, 100);
    self.demoLayer.backgroundColor = [UIColor grayColor].CGColor;
    [self.view.layer addSublayer:self.demoLayer];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSArray *colors = @[
                        (__bridge id)[UIColor blueColor].CGColor,
                        (__bridge id)[UIColor redColor].CGColor,
                        (__bridge id)[UIColor greenColor].CGColor,
                        (__bridge id)[UIColor blueColor].CGColor ];
    [self.demoLayer gpr_makeAnimations:^(GPRAnimator *animator) {
        animator.transition.duration(2.0).type(kCATransitionFade)
        .transition(^{self.demoLayer.backgroundColor = [UIColor orangeColor].CGColor;});
        animator.basicAnimation
        .duration(1.0).keyPath(@"transform.rotation.z")
        .autoreverses.repeatCount(2)
        .fromValue(@M_PI_2).toValue(@M_PI)
        .removedOnCompletion(NO).fillMode(kCAFillModeForwards);
        animator.keyFrameAnimation.keyPath(@"backgroundColor")
        .duration(3.0).fillModeForwards.values(colors);
        animator.springAnimation.duration(2.0).keyPath(@"position")
        .fromValue([NSValue valueWithCGPoint:CGPointMake(200, 150)])
        .toValue([NSValue valueWithCGPoint:CGPointMake(200, 400)])
        .mass(2.0).stiffness(120).damping(15);
    }];
}

@end
