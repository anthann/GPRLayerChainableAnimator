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
    [self.demoLayer gpr_makeAnimations:^(GPRAnimator *animator) {
        animator.basicAnimation.fillModeForwards
        .duration(3.0).keyPath(@"transform.rotation.z")
        .fromValue(@M_PI).toValue(@M_PI_2);
        animator.basicAnimation
        .duration(1.0).keyPath(@"transform.rotation.z")
        .autoreverses.repeatCount(2)
        .fromValue(@M_PI_2).toValue(@M_PI)
        .removedOnCompletion(NO).fillMode(kCAFillModeForwards);
    }];
}

@end
