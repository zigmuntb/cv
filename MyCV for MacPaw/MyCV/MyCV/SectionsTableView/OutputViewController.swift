//
//  OutputViewController.swift
//  MyCV
//
//  Created by Arsenkin Bogdan on 4/19/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class OutputViewController : UIViewController {
    
    @IBOutlet weak var infoAboutMeLabel: UITextView!
    
    var infoModel = InfoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoAboutMeLabel.text = infoModel.info
    }
    
}
