//
//  ViewController.swift
//  CalcLite
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var UserIsInTheMiddleOfTyping = false
    
    @IBAction private func touchButtons(_ sender: UIButton)  {
        let digit = sender.currentTitle!
        if UserIsInTheMiddleOfTyping {
            let TextCurrentlyInDisplay = display.text!
            display.text = TextCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        UserIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var head = CalculatorHead()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if UserIsInTheMiddleOfTyping {
            head.set0perand(operand: displayValue)
        }
        UserIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            head.perform0peration(symbol: mathematicalSymbol)
        }
        displayValue = head.result
    }
}
    
