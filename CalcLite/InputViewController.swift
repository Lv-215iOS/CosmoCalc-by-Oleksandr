//
//  InputViewController.swift
//  CalcLite
//
//  Created by adminaccount on 12/14/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

protocol InputInterface {
    var buttonDidPress: ((_ operation: String)->())? {get set}
}

class InputViewController: UIViewController, InputInterface {
    var mainVC: ViewController? = nil
    
    var buttonDidPress: ((String) -> ())? = nil
    
    @IBAction func touchButtons(_ sender: UIButton) {
        mainVC?.buttonPressed(button: sender)
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        mainVC?.performingCurrentOperation(operation: sender)
    }

    @IBAction func clear(_ sender: AnyObject) {
        mainVC?.clerAll(operand: sender)
    }
}
    
    
    
    


