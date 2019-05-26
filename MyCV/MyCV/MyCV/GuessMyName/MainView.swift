//
//  MainView.swift
//  MyCV
//
//  Created by Arsenkin Bogdan on 4/18/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    @IBOutlet weak var guessNameLabel: UILabel!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var buttoneOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var nextScreenButton: UIButton!
    
    var buttons: [UIButton] {
        return [buttoneOne, buttonTwo, buttonThree, buttonFour, buttonFive, buttonSix, buttonSeven, buttonEight]
    }
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        for button in buttons {
            button.setTitle("", for: .normal)
        }
        
        myNameLabel.text = ""
        nextScreenButton.layer.cornerRadius = 10.0
        nextScreenButton.layer.masksToBounds = true
    }
    
    func fill(with model: MainModel) {
        myNameLabel.text = model.outputString
        nextScreenButton.isHidden = true
    }
    
    //MARK: - Set letters to buttons
    func setLettersToButtons(model: MainModel) {
        
        let arrayFromFunc = model.arrayOfOneCorrectAndRandomChars()
        
        if arrayFromFunc.isEmpty {
            return
        }
        
        for (index, button) in buttons.enumerated() {
            button.setTitle(arrayFromFunc[index], for: .normal)
        }
    }
    
    func makeAllButtonsActive() {
        buttons.forEach { $0.isEnabled = true }
    }
    
}
