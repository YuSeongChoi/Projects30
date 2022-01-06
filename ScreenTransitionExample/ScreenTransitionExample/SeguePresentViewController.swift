//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by Mac on 2022/01/06.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapBakButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
