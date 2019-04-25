//
//  ViewController.swift
//  MyCV
//
//  Created by Arsenkin Bogdan on 4/18/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var mainView: MainView!
    var mainModel = MainModel()
    var errorSound: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Guess my name"
        mainView.fill(with: mainModel)
        mainView.setLettersToButtons(model: mainModel)
    }
    
    
    @IBAction func buttonsTapped(_ sender: UIButton) {
        checkForCorrectLetter(sender)
    }
    
    @IBAction func nextScreenButtonTapped(_ sender: UIButton) {
    }
    
    func checkForCorrectLetter(_ sender: UIButton) {
        if mainModel.letterCheckFor(sender.currentTitle ?? "") {
            mainView.setLettersToButtons(model: mainModel)
            mainView.makeAllButtonsActive()
            mainView.fill(with: mainModel)
        } else {
            sender.isEnabled = false
            playSound()
        }
        
        if mainModel.myNameArray.isEmpty {
            mainView.nextScreenButton.isHidden = false
        }
        
    }
    
    func playSound() {
        
        guard let path = Bundle.main.path(forResource: "errorSound", ofType: "mp3") else { return }
        
        do {
            errorSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            errorSound?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

