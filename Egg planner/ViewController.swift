//
//  ViewController.swift
//  Egg planner
//
//  Created by Sreenivas k on 22/03/21.
//

import UIKit

class ViewController: UIViewController {
    var hardness = ["Soft":5,"Medium":10,"Hard":15]

    @IBAction func softNess(_ sender: UIButton) {
        var ness = sender.currentTitle!
        print(hardness[ness]!)
    }
    


}

