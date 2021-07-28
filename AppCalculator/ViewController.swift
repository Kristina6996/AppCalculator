//
//  ViewController.swift
//  AppCalculator
//
//  Created by apple on 02.06.2021.
//

import UIKit

class ViewController: UIViewController {

@IBOutlet weak var displayResultLabel: UILabel!
var stillTyping = false
var firstOperand: Double = 0
var secondOperand: Double = 0
var operationSing: String = ""
var currentInput: Double {
        get {
            return Double (displayResultLabel.text!)!
        }
        set{
            displayResultLabel.text = "\(newValue)"
            stillTyping = false
        }
    }
    
 @IBAction func numberPressed(_ sender: UIButton) {
   
    let number = sender.currentTitle!
    
    if stillTyping {
    
    if ((displayResultLabel.text?.count)! < 20) {
       displayResultLabel.text = displayResultLabel.text! + number
    }
    } else {
        displayResultLabel.text = number
        stillTyping = true
    }
}

    @IBAction func twoOperandsSingPressed(_ sender: UIButton) {
        operationSing = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand,secondOperand)
    stillTyping = false
    }
    
    @IBAction func equalitySingPressed(_ sender: UIButton) {
    
        if stillTyping {
            secondOperand = currentInput
        }
        
        switch operationSing {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}

        case "÷":
            operateWithTwoOperands{$0 / $1}

        case "×":
            operateWithTwoOperands{$0 * $1}
       default: break


        }
        
    }
    
    
}
