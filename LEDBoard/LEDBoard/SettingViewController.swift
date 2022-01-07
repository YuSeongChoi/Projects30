//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by Mac on 2022/01/07.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        switch sender {
        case self.yellowButton:
            self.changeTextColor(color: .yellow)
        case self.purpleButton:
            self.changeTextColor(color: .purple)
        case self.greenButton:
            self.changeTextColor(color: .green)
        default:
            self.changeTextColor(color: .yellow)
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColor(color: .black)
        } else if sender == self.blueButton {
            self.changeBackgroundColor(color: .blue)
        } else {
            self.changeBackgroundColor(color: .orange)
        }
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        
    }
    
    private func changeTextColor(color: UIColor) {
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color: UIColor) {
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
