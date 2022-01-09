//
//  ViewController.swift
//  Calculator
//
//  Created by Mac on 2022/01/09.
//

/**
  - UIStackView : Axis(방향), Distribution(분배), Alignment(정렬), Spacing(간격)
  - IBInspectable(storyboard 적용), IBDesignable(실시간 적용)
 */

import UIKit

enum Operation {
    case add
    case subtract
    case multiply
    case divide
    case unknown
}

class ViewController: UIViewController {
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: Any) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: Any) {
        if self.displayNumber.count < 8 , !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    
    @IBAction func tapDivideButton(_ sender: Any) {
        self.operation(.divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: Any) {
        self.operation(.multiply)
    }
    
    @IBAction func tapSubtractButton(_ sender: Any) {
        self.operation(.subtract)
    }
    
    @IBAction func tapAddButton(_ sender: Any) {
        self.operation(.add)
    }
    
    @IBAction func tapEqualButton(_ sender: Any) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation) {
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                case .add:
                    self.result = "\(firstOperand + secondOperand)"
                    
                case .subtract:
                    self.result = "\(firstOperand - secondOperand)"
                    
                case .multiply:
                    self.result = "\(firstOperand * secondOperand)"
                    
                case .divide:
                    self.result = "\(firstOperand / secondOperand)"
                    
                default:
                    break
                }
                
                if let result = Double(self.result) ,result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = result
                self.numberOutputLabel.text = self.result
            }
            self.currentOperation = operation
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}

