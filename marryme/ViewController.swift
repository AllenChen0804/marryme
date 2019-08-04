//
//  ViewController.swift
//  marryme
//
//  Created by 陳永展 on 2019/7/26.
//  Copyright © 2019 abc. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet var answerButton: [UIButton]!

    
    @IBOutlet weak var timelabel: UILabel!
    
   
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var againButton: UIButton!
    
    
    
    var choices:[String] = []
    var totalScore:Int = 0
    var mul:qua?
    var test:[Int] = []
    var count = 0
    var counter = 120
    var timer = Timer()
    let roundString = [ "一", "二", "三", "四", "五", "六", "七", "八", "九", "十" ]

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        test = num.shuffled()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        changeQuestion()

    }
    
    @IBAction func choiceButton(_ sender: UIButton) {
        let number = answerButton.firstIndex(of: sender)
        if ( answerButton[number!].currentTitle == mul!.answer ) {
            let speechUtterance = AVSpeechUtterance(string: "ピンポンピンポン")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            speechUtterance.rate = 0.62
            speechUtterance.pitchMultiplier = 1.6
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
            background.image = UIImage(named: "9")
            
            totalScore += 10
            totalLabel.text = String(totalScore)
        }
        else {
            let speechUtterance = AVSpeechUtterance(string: "大笨蛋")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
            speechUtterance.rate = 0.62
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
            background.image = UIImage(named: "Ugly2")
            
        }
        count += 1
        if ( count < 10 ) {
                self.changeQuestion()
        }
        else {
            finalScore()
        }
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        let num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        test = num.shuffled()
        count = 0
        totalScore = 0
        totalLabel.text = String(totalScore)
        counter = 120
        timelabel.text = "2:00"
        for i in 0...3 {
            answerButton[i].isEnabled = true
        }
        changeQuestion()
        timelabel.isHidden = false
    }
    func changeQuestion() {
        mul = multiqua[test[count]]
        roundLabel.text = "第" + roundString[count] + "題"
        questionLabel.text = mul!.question
        choices = mul!.choice.shuffled()
        answerButton[0].setTitle(choices[0], for: .normal)
        answerButton[1].setTitle(choices[1], for: .normal)
        answerButton[2].setTitle(choices[2], for: .normal)
        answerButton[3].setTitle(choices[3], for: .normal)
        
    }
    func finalScore () {
        timer.invalidate()
        for i in 0...3 {
            answerButton[i].isEnabled = false
        }
        
        if totalScore >= 60
        {
            performSegue(withIdentifier: "good", sender: nil)
        }
        else
        {
           performSegue(withIdentifier: "bad", sender: nil)
        }
    }
    
    
    @objc  func timerRun () {
        counter -= 1
        let countSec:Int = counter % 60
        let countMin:Int = counter / 60
        timelabel.text = String(countMin) + ":" + String( format: "%02d", countSec )
        if ( counter > 0 ) {
        }
        else {
            finalScore()
        }
    }
    

}





