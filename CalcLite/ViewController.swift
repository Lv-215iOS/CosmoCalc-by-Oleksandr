//
//  ViewController.swift
//  CalcLite
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    
    //private var head = CalculatorHead()
    
    var outputController: OutputViewController? = nil
    var inputController: InputViewController? = nil
    private var head = CalculatorHead()
    
    //private var UserIsInTheMiddleOfTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad() // Do any additional setup after loading the view
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerEmbedSegue" {
            outputController = segue.destination as? OutputViewController
            outputController?.mainVC = self
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
    
    private var UserIsInTheMiddleOfTyping = false
    private var decimalUsed = false
    
    func buttonPressed(button: UIButton) {
        let digit = button.currentTitle!
        if UserIsInTheMiddleOfTyping {
            if digit == "." && decimalUsed == true {
                return
            } else if digit == "." && decimalUsed == false {
                decimalUsed = true
            }
            
            let TextCurrentlyInDisplay = outputController!.display.text!
            outputController!.display.text = TextCurrentlyInDisplay + digit
        } else {
            outputController!.display.text = digit
        }
        UserIsInTheMiddleOfTyping = true
    }
    
    func performingCurrentOperation(operation: UIButton) {
        if UserIsInTheMiddleOfTyping {
            head.digit(value: displayValue)
            UserIsInTheMiddleOfTyping = false
        }
        head.perform0peration(symbol: operation.currentTitle!)
        
        /*if sender.currentTitle == "-" {
         head.binary(operation: .Minus)
         }*/
        //displayValue = head.result
        
        
        /*head.result = { (value, error) -> () in //viewDidLoad
            self.displayValue = value!*/
        head.result = { (value, error) -> () in
            if (value != nil) {
                self.outputController?.outputResult(info: "\(value!)")
            }
        }
    }
    
    func clerAll(operand: AnyObject) {
        UserIsInTheMiddleOfTyping = false
        decimalUsed = false
        print("clear pressed")
        head.clear()
        //displayValue = head.result
        head.result = { (value, error) -> () in
            self.displayValue = value!
        }
        self.outputController?.display.text = "0"

    }

    //end
}
    

    
