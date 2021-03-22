//
//  ViewController.swift
//  Egg planner
//
//  Created by Sreenivas k on 22/03/21.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
   
   
    @IBOutlet weak var titleLable: UITextView!
    var player: AVAudioPlayer?
    @IBOutlet weak var ProgressBar: UIProgressView!
    var hardness = ["Soft":5,"Medium":10*60,"Hard":15*60]
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
        playSound()
        titleLable.text="Done !"
    }
}
    func playSound() {
           guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

           do {
               try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
               try AVAudioSession.sharedInstance().setActive(true)
               player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
               guard let player = player else { return }

               player.play()

           } catch let error {
               print(error.localizedDescription)
           }
       }
}

