//
//  ViewController.swift
//  CalcLite
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var outputController: OutputViewController? = nil
    var inputController: InputViewController? = nil
    var userIsInTheMiddleOfTyping = false
    var decimalUsed = false
    
    
    private var head = CalculatorHead()
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerEmbedSegue" {
            outputController = segue.destination as? OutputViewController
        } else if segue.identifier == "InputControllerEmbedSegue" {
            inputController = segue.destination as? InputViewController
            inputController?.buttonDidPress = { [unowned self] operation in
                self.buttonDidPress(operation: operation)
            }
        }
    }
    
    var displayValue: Double {
        get {
            return Double(outputController!.display.text!)!
        }
        set {
            outputController!.display.text = String(newValue)
        }
    }
    
    func buttonPressed(button: String) {
        let digit = button
        if userIsInTheMiddleOfTyping {
            let TextCurrentlyInDisplay = outputController!.display.text!
            outputController!.display.text = TextCurrentlyInDisplay + digit
        } else {
            outputController!.display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    func performingCurrentOperation(operation: String) {
        if userIsInTheMiddleOfTyping {
            head.digit(value: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        decimalUsed = false
        head.perform0peration(symbol: operation)
        
        head.result = { (value, error) -> () in
            if (value != nil) {
                self.outputController?.outputResult(info: "\(value!)")
            }
        }
    }
    
    func clearButtonPressed(operation: String) {
        userIsInTheMiddleOfTyping = false
        decimalUsed = false
        head.clear()
        
        head.result = { (value, error) -> () in
            self.displayValue = value!
        }
        self.outputController?.display.text = "0.0"
    }

    
    func dotButtonPressed(operation: String) {
        if !decimalUsed && userIsInTheMiddleOfTyping {
            outputController!.display.text = String(outputController!.display.text! + ".")
            decimalUsed = true
        } else if !decimalUsed && !userIsInTheMiddleOfTyping {
            outputController!.display.text = String("0.")
            decimalUsed = true
            userIsInTheMiddleOfTyping = true
        }
    }
    
    func buttonDidPress(operation: String) {
        switch operation {
        case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"
            : buttonPressed(button: operation)
        case "."
            : dotButtonPressed(operation: operation)
        case "π", "e", "+", "-", "/", "*", "√", "^",
             "log", "cos", "sin", "tg", "ctg", "%", "±", "="
            : performingCurrentOperation(operation: operation)
        case "c"
            : clearButtonPressed(operation: operation)
        default:
            break
        }
    }
}
    

    
