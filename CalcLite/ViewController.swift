//
//  ViewController.swift
//  CalcLite
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    
    var outputController: OutputViewController? = nil
    var inputController: InputViewController? = nil
    private var head = CalculatorHead()
    
    override func viewDidLoad() {
        super.viewDidLoad() // Do any additional setup after loading the view
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerEmbedSegue" {
            outputController = segue.destination as? OutputViewController
        } else if segue.identifier == "InputControllerEmbedSegue" {
            inputController = segue.destination as? InputViewController
            inputController?.mainVC = self
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
    
    private var userIsInTheMiddleOfTyping = false
    private var decimalUsed = false
    
    func buttonPressed(button: UIButton) {
        let digit = button.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            if digit == "." && decimalUsed == true {
                decimalUsed = false
            } else if digit == "." && decimalUsed == false {
                decimalUsed = true
            }
            
            let TextCurrentlyInDisplay = outputController!.display.text!
            outputController!.display.text = TextCurrentlyInDisplay + digit
        } else {
            outputController!.display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    func performingCurrentOperation(operation: UIButton) {
        if userIsInTheMiddleOfTyping {
            head.digit(value: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        head.perform0peration(symbol: operation.currentTitle!)
        
        head.result = { (value, error) -> () in
            if (value != nil) {
                self.outputController?.outputResult(info: "\(value!)")
            }
        }
    }
    
    func clerAll(operand: AnyObject) {
        userIsInTheMiddleOfTyping = false
        decimalUsed = false
        head.clear()
        
        head.result = { (value, error) -> () in
            self.displayValue = value!
        }
        self.outputController?.display.text = "0"
    }
}
    

    
