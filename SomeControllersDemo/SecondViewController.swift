//
//  SecondViewController.swift
//  SomeControllersDemo
//
//  Created by leezb101 on 2018/4/21.
//  Copyright © 2018年 leezb. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    lazy var dismissButton: UIButton = {
        let result = UIButton(type: .system)
        result.setTitle("取消", for: .normal)
        result.backgroundColor = .green
        result.setTitleColor(.blue, for: .normal)
        result.frame = CGRect(x: 8, y: 8, width: 25, height: 15)
        result.addTarget(self, action: #selector(dismissSelf(sender:)), for: .touchUpInside)
        return result
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        view.addSubview(dismissButton)
        // Do any additional setup after loading the view.
    }

    @objc func dismissSelf(sender: UIButton) {
        self.dismiss(animated: true) {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
