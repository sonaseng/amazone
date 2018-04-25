//
//  HomeViewController.swift
//  CKCC
//
//  Created by Bun Leap on 3/21/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var eventCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load .xib file
        let cellFile = UINib(nibName: "EventCollectionViewCell", bundle: nil)
        
        // Register .xib to table view
        eventCollectionView.register(cellFile, forCellWithReuseIdentifier: "cell_event")
        
        // Assign data source and delegate to collection view
        eventCollectionView.dataSource = self
        eventCollectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_event", for: indexPath) as! EventCollectionViewCell
        cell.eventImageView.image = #imageLiteral(resourceName: "img_ckcc_logo")
        cell.eventTitleLabel.text = "This is Event"
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue_test", sender: nil)
    }

}
