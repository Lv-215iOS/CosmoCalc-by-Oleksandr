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
    
    @IBOutlet weak var animateDivButton: UIButton!
    @IBOutlet weak var animateMultButton: UIButton!
    @IBOutlet weak var animateMinButton: UIButton!
    @IBOutlet weak var animatePlusButton: UIButton!
    @IBOutlet weak var animate7Button: UIButton!
    @IBOutlet weak var animate8Button: UIButton!
    @IBOutlet weak var animate9Button: UIButton!
    @IBOutlet weak var animateClearButton: UIButton!
    @IBOutlet weak var animate4Button: UIButton!
    @IBOutlet weak var animate5Button: UIButton!
    @IBOutlet weak var animate6Button: UIButton!
    @IBOutlet weak var animateSinButton: UIButton!
    @IBOutlet weak var animate1Button: UIButton!
    @IBOutlet weak var animate2Button: UIButton!
    @IBOutlet weak var animate3Button: UIButton!
    @IBOutlet weak var animateCosButton: UIButton!
    @IBOutlet weak var animate0Button: UIButton!
    @IBOutlet weak var animateDotButton: UIButton!
    @IBOutlet weak var animateEqualButton: UIButton!
    @IBOutlet weak var animateTanButton: UIButton!
    @IBOutlet weak var animatePiButton: UIButton!
    @IBOutlet weak var animateSignButton: UIButton!
    @IBOutlet weak var animatePowButton: UIButton!
    @IBOutlet weak var animateCtanButton: UIButton!
    @IBOutlet weak var animateExpButton: UIButton!
    @IBOutlet weak var animatePersButton: UIButton!
    @IBOutlet weak var animateLogButton: UIButton!
    @IBOutlet weak var animateSqrtButton: UIButton!
    
    var audioForTheButton = AVAudioPlayer()
    var buttonDidPress: ((String) -> ())? = nil

    @IBAction func buttonDidPress(_ sender: UIButton) {
        buttonDidPress?(sender.currentTitle!)
        audioForTheButton.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //implemented sound for buttons
        do {
            audioForTheButton = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "button0.1.1", ofType: "mp3")!))
            audioForTheButton.prepareToPlay()
        }
        catch {
            print(error)
        }
        
        //implemented animation for buttons
        animateDivButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateDivButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateMultButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateMultButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateMinButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateMinButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animatePlusButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animatePlusButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animate7Button.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animate7Button.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animate8Button.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animate8Button.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animate9Button.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animate9Button.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateClearButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateClearButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animate4Button.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animate4Button.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animate5Button.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animate5Button.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animate6Button.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animate6Button.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateSinButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateSinButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animate1Button.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animate1Button.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animate2Button.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animate2Button.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animate3Button.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animate3Button.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateCosButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateCosButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animate0Button.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animate0Button.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateDotButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateDotButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateEqualButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateEqualButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateTanButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateTanButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animatePiButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animatePiButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateSignButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateSignButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animatePowButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animatePowButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateCtanButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateCtanButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateExpButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateExpButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animatePersButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 30,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animatePersButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateLogButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateLogButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
        
        animateSqrtButton.center.x = self.view.frame.width + 30
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions(rawValue: UInt(5.0)),
                       animations: ({
                        self.animateSqrtButton.center.x = self.view.frame.width / 2
                       }),
                       completion: nil)
    }
}
    
    
    
    


