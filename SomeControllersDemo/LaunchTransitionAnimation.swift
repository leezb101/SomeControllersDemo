//
//  LaunchTransitionAnimation.swift
//  SomeControllersDemo
//
//  Created by leezb101 on 2018/4/21.
//  Copyright © 2018年 leezb. All rights reserved.
//

import UIKit

class LaunchTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        
        let container = transitionContext.containerView
        container.addSubview(toVC.view)
        
        var transform = CATransform3DIdentity
        transform.m34 = -0.002
        container.layer.sublayerTransform = transform
        
        let initialFrame = transitionContext.initialFrame(for: fromVC)
        toVC.view.frame = initialFrame
        toVC.view.layer.transform = self.rotate(.pi / 2)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                fromVC.view.layer.transform = self.rotate( -.pi / 2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                toVC.view.layer.transform = self.rotate(0)
            })
            
            
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
    
    func rotate(_ angle: CGFloat) -> CATransform3D {
        return CATransform3DMakeRotation(angle, 0, 1, 0)
    }
    
}
