//
//  OutputViewController.swift
//  CalcLite
//
//  Created by adminaccount on 12/14/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

//protocol OutputInterface {
//    func outputResult(info: String)
//}

class OutputViewController: UIViewController, OutputInterface {
    @IBOutlet weak var display: UILabel!
    func outputResult(info: String) {
        display.text = info
    }
}
