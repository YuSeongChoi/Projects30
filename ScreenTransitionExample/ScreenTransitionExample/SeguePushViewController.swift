//
//  SeguePushViewController.swift
//  ScreenTransitionExample
//
//  Created by Mac on 2022/01/06.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
