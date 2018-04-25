//
//  ProfileTableViewController.swift
//  CKCC
//
//  Created by Bun Leap on 3/28/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change image view to circle
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 35
        
        // Load steve.jpg as Data
        let imageUrl = URL(string: "http://test.js-cambodia.com/ckcc/image/steve.jpg")!
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            // Convert the Data into Image
            if data == nil {
                // Error
            } else {
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.profileImageView.image = image
                }
            }
            
        }
        task.resume()
    }

}
