//
//  PresentationController.swift
//  SomeControllersDemo
//
//  Created by leezb101 on 2018/4/21.
//  Copyright © 2018年 leezb. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    
    private var controllerHeight: CGFloat = 0
    
    lazy var visualView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
        let result = UIVisualEffectView(effect: blur)
        result.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        result.frame = self.containerView!.bounds
        return result
    }()
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    convenience init(presentedController presented: UIViewController, presentingController presenting: UIViewController?, presentHeight: CGFloat) {
        self.init(presentedViewController: presented, presenting: presenting)
        controllerHeight = presentHeight
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        return CGRect(x: 0, y: screenHeight - controllerHeight, width: screenWidth, height: controllerHeight)
    }
    
    override func presentationTransitionWillBegin() {
        self.containerView?.addSubview(visualView)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        if !completed {
            self.visualView.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin() {
        self.visualView.alpha = 0
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            self.visualView.removeFromSuperview()
        }
    }
    
    
}
