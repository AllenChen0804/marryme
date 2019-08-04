//
//  HomeViewController.swift
//  marryme
//
//  Created by 陳永展 on 2019/8/1.
//  Copyright © 2019 abc. All rights reserved.
//

import UIKit
import AVFoundation
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
let speechUtterance = AVSpeechUtterance(string: "想要抱得美人歸？請先按開始挑戰,答對以下問題才可以嘿嘿嘿,答錯你就自己睡！")
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        speechUtterance.rate = 0.6
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
