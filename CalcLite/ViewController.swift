//
//  ViewController.swift
//  CalcLite
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //private var head = CalculatorHead()
    
    var outputController: OutputViewController? = nil
    var inputController: InputViewController? = nil
    
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

//
    @IBOutlet private weak var display: UILabel!
    
    private var UserIsInTheMiddleOfTyping = false
    private var decimalUsed = false
    
    @IBAction private func touchButtons(_ sender: UIButton)  {
        let digit = sender.currentTitle!
        if UserIsInTheMiddleOfTyping {
            if digit == "." && decimalUsed == true {
                return
            } else if digit == "." && decimalUsed == false {
                decimalUsed = true
            }
            
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
        //displayValue = head.result
        
        head.result = { (value, error) -> () in //viewDidLoad
            self.displayValue = value!
        }
    }
    
    @IBAction func clear(_ sender: AnyObject) {
        UserIsInTheMiddleOfTyping = false
        decimalUsed = false
        head.clear()
        //displayValue = head.result
        head.result = { (value, error) -> () in
            self.displayValue = value!
        }
        self.display.text = "0"
    }
    
}
