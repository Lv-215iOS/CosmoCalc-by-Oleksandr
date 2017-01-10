//
//  InputViewController.swift
//  CalcLite
//
//  Created by adminaccount on 12/14/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit
import AVFoundation

class InputViewController: UIViewController, InputInterface {
    
    var audioForTheButton = AVAudioPlayer()
    
    var buttonDidPress: ((String) -> ())? = nil

    @IBAction func buttonDidPress(_ sender: UIButton) {
        buttonDidPress?(sender.currentTitle!)
        audioForTheButton.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            audioForTheButton = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "button0.1.1", ofType: "mp3")!))
            audioForTheButton.prepareToPlay()
        }
        catch {
            print(error)
        }
    }
}
    
    
    
    


