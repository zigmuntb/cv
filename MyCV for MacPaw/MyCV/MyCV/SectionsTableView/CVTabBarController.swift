//
//  CVTabBarController.swift
//  MyCV
//
//  Created by Arsenkin Bogdan on 4/21/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class CVTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var infoModel = InfoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        title = "My CV"
        
        selectedIndex = 0
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is TableViewController {
            navigationItem.rightBarButtonItem = nil
        }
        
        if viewController is OutputViewController {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(share(sender:)))
        }
    }
    
    @objc private func share(sender: UIBarButtonItem) {
        let text = [infoModel.info]
        let activityController = UIActivityViewController(activityItems: text, applicationActivities: nil)
        
        present(activityController, animated: true, completion: nil)
    }
}
