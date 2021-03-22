//
//  ViewController.swift
//  Egg planner
//
//  Created by Sreenivas k on 22/03/21.
//

import UIKit

class ViewController: UIViewController {
    var hardness = ["Soft":5,"Medium":10*60,"Hard":15*60]
    var counter = 0
    var timer=Timer()
    @IBAction func softNess(_ sender: UIButton) {
        timer.invalidate()
        var ness = sender.currentTitle!
         counter = hardness[ness]!
        
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
@objc func updateCounter() {
    //example functionality
    if counter > 0 {
        print("\(counter) seconds ")
        counter -= 1
        if(counter==0){
            print("Egg Ready")
        }
    }
}

}

