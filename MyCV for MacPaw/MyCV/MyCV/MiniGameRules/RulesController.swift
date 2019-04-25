//
//  RulesController.swift
//  MyCV
//
//  Created by Arsenkin Bogdan on 4/23/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class RulesController: UIViewController {
    
    @IBOutlet weak var text1Label: UILabel!
    @IBOutlet weak var toTheGameButotn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1.5) {
            self.text1Label.frame = CGRect(x: 16, y: 190, width: 288, height: 132.5)
            
        }
        
        showButton()
    }
    
    func showButton(){
        toTheGameButotn.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.toTheGameButotn.isHidden = false
        }
    }
    
}
