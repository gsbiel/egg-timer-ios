//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes : [String : Int] = ["Soft":1,"Medium":7,"Hard":12]
    var timer = Timer()
    var seconds = 60
    var isTimerRunning = false
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        let result = eggTimes[hardness]!
        seconds = 60*result
        if !isTimerRunning {
            runTimer()
        }
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
        if seconds>=0 {
            print(seconds)
            seconds -= 1
        }
        else{
            stopTimer()
            seconds = 60
        }
    }
}
