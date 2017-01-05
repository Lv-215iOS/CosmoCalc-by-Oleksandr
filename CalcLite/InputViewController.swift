//
//  InputViewController.swift
//  CalcLite
//
//  Created by adminaccount on 12/14/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, InputInterface {
    
    var buttonDidPress: ((String) -> ())? = nil

    @IBAction func buttonDidPress(_ sender: UIButton) {
        buttonDidPress?(sender.currentTitle!)
    }
}
    
    
    
    


