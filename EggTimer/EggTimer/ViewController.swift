//
//  ViewController.swift
//  EggTimer
//
//  Created by Aashiq Mortimer on 23/09/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var progBar: UIProgressView!
    
    //300, 420, 720
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer?

    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progBar.progress = 0.0
        secondsPassed = 0
        mainTitle.text = hardness
        
        startTimer()
        
        func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.secondsPassed < self.totalTime {
                    
                    self.secondsPassed += 1
                    
                    self.progBar.progress = Float(self.secondsPassed) / Float(self.totalTime)
                    
                    
                } else {
                    Timer.invalidate()
                    self.mainTitle.text = "Egg timer complete!"
                    self.playSound()
                }
            }
        }
    }
    @IBOutlet weak var mainTitle: UILabel!
}
