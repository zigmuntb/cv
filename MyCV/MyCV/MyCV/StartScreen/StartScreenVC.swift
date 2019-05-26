//
//  StartScreenVC.swift
//  MyCV
//
//  Created by Arsenkin Bogdan on 4/18/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var checkOutCV: UILabel!
    @IBOutlet weak var nextScreen: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My CV"
        imageView.image = UIImage(named: "myPhoto")
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        checkOutCV.text = "Check out my CV"
        nextScreen.setTitle("Let's GO", for: .normal)
        
    }
    
    @IBAction func showPhoto(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: PhotoController.self))
        self.present(controller, animated: true, completion: nil)
    }
}
