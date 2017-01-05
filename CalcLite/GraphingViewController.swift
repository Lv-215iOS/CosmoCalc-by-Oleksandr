//
//  GraphingViewController.swift
//  CalcLite
//
//  Created by adminaccount on 1/5/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class GraphingViewController: UIViewController {
    
    
    @IBAction func transitionViewController(_ sender: Any) {
        performSegue(withIdentifier: "segueBackToViewController", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
