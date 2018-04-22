//
//  LaunchViewController.swift
//  SomeControllersDemo
//
//  Created by leezb101 on 2018/4/21.
//  Copyright © 2018年 leezb. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    var delayBlock: (() -> ())!
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.font = .systemFont(ofSize: 25)
        label.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 30, width: 200, height: 60)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        welcomeLabel.text = "Welcome launching!"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {[weak self] in
            guard let wkself = self else { return }
                wkself.delayBlock()
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("启动界面被销毁。。。")
    }

}

extension LaunchViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LaunchTransitionAnimation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LaunchTransitionAnimation()
    }
    
}
