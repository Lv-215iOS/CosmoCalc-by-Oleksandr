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
            head.digit(value: displayValue)
            UserIsInTheMiddleOfTyping = false
        }
        head.perform0peration(symbol: sender.currentTitle!)
        
        /*if sender.currentTitle == "-" {
            head.binary(operation: .Minus)
        }*/
        // displayValue = head.result
        
        head.result = { (value, error) -> () in //viewDidLoad
            self.displayValue = value!
        }

    }
}
    
