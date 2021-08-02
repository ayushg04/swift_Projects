//
//  ViewController.swift
//  textTospeech
//
//  Created by daffolapmac-179 on 09/05/21.
//

import UIKit
import AVKit
/// class that contains the files of speech
class ViewController: UIViewController {

    override func viewDidLoad() {
        /// Lifecycle Meathod
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = "This is the Text to Speech Sample Application"
        
        let utternace = AVSpeechUtterance(string: s)
        utternace.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utternace.rate = 0.5
        
        let synthesis = AVSpeechSynthesizer()
        synthesis.speak(utternace)
        
    
    }
    
    

}

