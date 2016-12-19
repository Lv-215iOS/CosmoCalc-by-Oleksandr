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
    
    
    
    private var UserIsInTheMiddleOfTyping = false
    private var decimalUsed = false
    
    
    @IBAction func touchButtons(_ sender: UIButton) {
        mainVC?.buttonPressed(button: sender)
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        mainVC?.performingCurrentOperation(operation: sender)
    }

    @IBAction func clear(_ sender: AnyObject) {
        mainVC?.clerAll(operand: sender)
    }
    
    /*
     func pressDigit(_ sender: UIButton) {
     buttonDidPress?(sender.currentTitle!)
     }
     
     func binaryOperationPressed(_ sender: UIButton){
     buttonDidPress?(sender.currentTitle!)
     }
     
     func equalOperationPressed(_ sender: UIButton) {
     buttonDidPress?(sender.currentTitle!)
     }*/
    
    
    
    
    
    /*override func viewDidLoad() {
     super.viewDidLoad()
     
     // Do any additional setup after loading the view.
     }
     override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     }*/
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

    
    //end
}
    
    
    
    


