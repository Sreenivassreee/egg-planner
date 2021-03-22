//
//  ViewController.swift
//  Egg planner
//
//  Created by Sreenivas k on 22/03/21.
//

import UIKit

class ViewController: UIViewController {
   
   
    @IBOutlet weak var titleLable: UITextView!
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    var hardness = ["Soft":1*60,"Medium":10*60,"Hard":15*60]
    var totalTime=0
    var passedTime=0
    
    
    var timer=Timer()
    @IBAction func softNess(_ sender: UIButton) {
        
        timer.invalidate()
        ProgressBar.progress=0.0
         passedTime=0
        let ness = sender.currentTitle!
        titleLable.text=ness
         totalTime = hardness[ness]!
    
        
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
@objc func updateCounter() {
    if passedTime < totalTime {
        passedTime += 1
        let progressTime = Float(passedTime)/Float(totalTime)
        ProgressBar.progress=progressTime
       
    }else{
        timer.invalidate()
        titleLable.text="Done !"
    }
}

}

