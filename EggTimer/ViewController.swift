//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTime = ["Soft": 7, "Medium": 9, "Hard": 12]
    
    var totalTime = 0
    
    var secondsPased = 0
    
    var timer = Timer()
    
    var player: AVAudioPlayer!

    @IBAction func handlerEggTimer(_ sender: UIButton) {
        progressBar.progress = 1.0
        let handlerTime = sender.currentTitle
        totalTime = eggTime[handlerTime!]!
        progressBar.progress = 0.0
        secondsPased = 0
        titleLabel.text = handlerTime
        
        countdownTimer()
    }

    func countdownTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPased < self.totalTime {
                self.secondsPased += 1
                self.progressBar.progress = Float(self.secondsPased) / Float(self.totalTime)

            } else {
                    self.timer.invalidate()
                    self.titleLabel.text = "DONE !"
                    self.player = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!)
                    self.player.play()
                }
            }
    }
}
