//
//  EventsViewController.swift
//  CKCC
//
//  Created by Bun Leap on 3/21/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var eventTableView: UITableView!
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load .xib file
        let cellFile = UINib(nibName: "EventTableViewCell", bundle: nil)
        
        // Register .xib to table view
        eventTableView.register(cellFile, forCellReuseIdentifier: "cell_event")
        
        // Assign data source to table view
        eventTableView.dataSource = self
        
        // Assign delegate to table view
        eventTableView.delegate = self
        
        // Load list of events from server
        let url = URL(string: "http://test.js-cambodia.com/ckcc/events.json")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Convert respone (json) to swift object
            let decoder = JSONDecoder()
            let events = try? decoder.decode([Event].self, from: data!)
            if events == nil {
                print("Load event error: ", error?.localizedDescription)
            } else {
                self.events = events!
                DispatchQueue.main.async {
                    self.eventTableView.reloadData()
                }
            }
        }
        task.resume()
        print("Start loading data")
    }
    
    // Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_event") as! EventTableViewCell
        let event = events[indexPath.row]
        cell.eventTitleLabel.text = event.title
        
        // Load event image from server
        print("Image url: ", event.imageUrl)
        if let imageUrl = URL(string: event.imageUrl) {
            let task = URLSession.shared.dataTask(with: imageUrl, completionHandler: { (data, response, error) in
                if data != nil {
                    let image = UIImage(data: data!)
                    DispatchQueue.main.async {
                        cell.eventImageView.image = image
                    }
                }
            })
            task.resume()
        }
        
        return cell
        
    }
    
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue_event_detail", sender: nil)
    }

}




