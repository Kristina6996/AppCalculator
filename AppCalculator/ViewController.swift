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
var dotIsPlaced = false
var firstOperand: Double = 0
var secondOperand: Double = 0
var operationSign: String = ""
var currentInput: Double
    {
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
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlaced = false
        }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand,secondOperand)
    stillTyping = false
    }
    
    @IBAction func equalitySingPressed(_ sender: UIButton) {
    
        if stillTyping {
            secondOperand = currentInput
        }
        
        dotIsPlaced = false
        
        switch operationSign {
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
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
    firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        dotIsPlaced = false
        operationSign = ""
    }
    
    @IBAction func PlusMinusButtonPressed(_ sender: UIButton) {
    currentInput = -currentInput
    }


    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
      }
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced {
            displayResultLabel.text = displayResultLabel.text! + "."
            dotIsPlaced = true
        } else if !stillTyping && !dotIsPlaced {
            displayResultLabel.text = "0."
        }
    }
    



}
