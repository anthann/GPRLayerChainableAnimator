# GPRLayerChainableAnimator

[![Version](https://img.shields.io/cocoapods/v/GPRLayerChainableAnimator.svg?style=flat)](http://cocoapods.org/pods/GPRLayerChainableAnimator)
[![License](https://img.shields.io/cocoapods/l/GPRLayerChainableAnimator.svg?style=flat)](http://cocoapods.org/pods/GPRLayerChainableAnimator)
[![Platform](https://img.shields.io/cocoapods/p/GPRLayerChainableAnimator.svg?style=flat)](http://cocoapods.org/pods/GPRLayerChainableAnimator)

借助Objective-C的语法糖，方便用户通过链式调用的语法书写Core Animations。

## 使用说明

例如CABasicAnimation，我们通常这样写：

```
CABasicAnimation *animation = [CABasicAnimation animation];
animation.duration = 1.0f;
animation.keyPath = @"transform.rotation.z";
animation.repeatCount = 2;
animation.fromValue = @M_PI_2;
animation.toValue = @M_PI;
animation.autoreverses = YES;
animation.removedOnCompletion = NO;
animation.fillMode = kCAFillModeForwards;
```

最后再把这个`animation`应用到`CALayer`的实例上：

```
[layer addAnimation: animation.toValue forKey:@"some key"];
``` 

使用本库，上述代码可以简化为这样：  


```  
#import "CALayer+GPRAnimation.h"

[layer gpr_makeAnimations:^(GPRAnimator *animator) {
    animator.basicAnimation
    .duration(1.0).keyPath(@"transform.rotation.z")
    .autoreverses.repeatCount(2)
    .fromValue(@M_PI_2).toValue(@M_PI)
    .removedOnCompletion(NO).fillMode(kCAFillModeForwards);
}];
```

其中，`animator.basicAnimation`的语法创建了`CABasicAnimation`的实例，其后的链式调用依次设置了动画的各个参数。  

目前还支持创建`CAKeyframeAnimation`、`CAPropertyAnimation`、`CATransition`、`CASpringAnimation`等动画实例。  

不仅如此，我们还支持依次播放多个动画：  

```
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
```  

以上示例中，依次顺序执行了4个独立的动画，每个动画将在上一个动画播放完成的时候开始。注意：如果想要后一个动画接续前一个动画的状态播放，需要设置前一个动画的`removedOnCompletion(NO)`和`fillMode(kCAFillModeForwards)`，或者使用我们提供的封装`fillModeForwards`。

## TODO  

* `CATransition`是一种比较特殊的动画，如果接续在其他动画之后执行，有可能有问题。  
* 通过合适的语法实现`CAAnimationGroup`，并且Group的动画也可以跟其他独立的动画接续播放。  

## 安装

GPRLayerChainableAnimator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:  
GPRLayerChainableAnimator加入CocoaPods，可以通过在Podfile中增加以下行来使用：

```ruby
pod 'GPRLayerChainableAnimator'
```

## Author

anthann

## License

GPRLayerChainableAnimator is available under the MIT license. See the LICENSE file for more info.
