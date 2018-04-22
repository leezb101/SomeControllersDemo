//
//  ViewController.swift
//  SomeControllersDemo
//
//  Created by leezb101 on 2018/4/21.
//  Copyright © 2018年 leezb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var presentButton: UIButton = {
        let result = UIButton(type: .system)
        result.setTitle("底部弹出", for: .normal)
        result.setTitleColor(.blue, for: .normal)
        result.addTarget(self, action: #selector(presentBottom(sender:)), for: .touchUpInside)
        result.frame = CGRect(x: view.frame.midX - 40, y: view.frame.midY - 20, width: 80, height: 40)
        return result
    }()
    
    lazy var popoverButton: UIButton = {
        let result = UIButton(type: .system)
        result.setTitle("popover", for: .normal)
        result.backgroundColor = .green
        result.setTitleColor(.blue, for: .normal)
        result.frame = CGRect(x: view.frame.maxX - 100, y: 80, width: 80, height: 40)
        result.addTarget(self, action: #selector(popover(sender:)), for: .touchUpInside)
        return result
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(presentButton)
        self.view.addSubview(popoverButton)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func presentBottom(sender: UIButton) {
        let secondVC = SecondViewController()
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
        self.present(secondVC, animated: true) {
            print("底部vc弹出成功。。。")
        }
    }
    
    @objc func popover(sender: UIButton) {
        let popvc = SecondViewController()
        popvc.modalPresentationStyle = .popover
        popvc.preferredContentSize = CGSize(width: 200, height: 300)
        
        let poppresent = popvc.popoverPresentationController
        poppresent?.backgroundColor = .yellow
        poppresent?.delegate = self
        poppresent?.sourceRect = self.popoverButton.bounds
        poppresent?.sourceView = self.popoverButton
        poppresent?.permittedArrowDirections = .up
        self.present(popvc, animated: true) {
            
        }
    }

}

extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedController: presented, presentingController: presenting, presentHeight: 100)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("popover视图控制器消失了。。。")
    }
    
}
