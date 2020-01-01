//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes : [String : Int] = ["Soft":10,"Medium":20,"Hard":30]
    var timer = Timer()
    var seconds = 60
    var totalTimer = 10
    var isTimerRunning = false
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        let result = eggTimes[hardness]!
        seconds = result
        totalTimer = result
        if !isTimerRunning {
            runTimer()
        }
        setProgress(progress: 1.0)
    }
    
    func runTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
   
    isTimerRunning = true
    }
    
    func stopTimer(){
        timer.invalidate()
        isTimerRunning = false
    }
    
    @objc func updateTimer(){
        var newProgress: Float = 0.0
        if seconds>=0 {
            print(seconds)
            seconds -= 1
            newProgress = Float(seconds)/Float(totalTimer)
            setProgress(progress: newProgress)
        }
        else{
            stopTimer()
            seconds = 60
        }
    }
    
    func setProgress(progress : Float){
        progressBar.progress = progress
    }
}
