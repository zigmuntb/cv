//
//  TableViewController.swift
//  MyCV
//
//  Created by Arsenkin Bogdan on 4/19/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class TableViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var infoModel = InfoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        photoImageView.image = UIImage(named: "myPhoto")
        photoImageView.layer.borderWidth = 1
        photoImageView.layer.borderColor = UIColor.black.cgColor
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
        photoImageView.clipsToBounds = true
        
//        tabBarItem = UITabBarItem(title: "Contacts", image: nil, tag: 0)
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My contacts"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoModel.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CVInfoCell.self), for: indexPath) as? CVInfoCell else {return UITableViewCell()}
        let row = indexPath.row
        
        cell.titleLabel.text = infoModel.contacts[row]
        cell.contactsTextView.text = infoModel.contactsInfo[row]
        
        return cell
    }
    
    @IBAction func showPhotoButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: PhotoController.self))
        self.present(controller, animated: true, completion: nil)
    }
    
    
}
