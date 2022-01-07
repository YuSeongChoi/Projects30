//
//  ViewController.swift
//  LEDBoard
//
//  Created by Mac on 2022/01/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
    }
}

