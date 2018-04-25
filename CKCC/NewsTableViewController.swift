//
//  NewsTableViewController.swift
//  CKCC
//
//  Created by Bun Leap on 3/26/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_news")!
        cell.textLabel?.text = "Event"
        cell.detailTextLabel?.text = "Description"
        return cell
    }
    
    // Event user pull refersh control
    @IBAction func onRefreshControlPull(_ sender: Any) {
        // Close refresh control
        refreshControl?.endRefreshing()
    }
    

}
