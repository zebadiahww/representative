//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Zebadiah Watson on 10/2/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        let state = States.all[indexPath.row]

        cell.textLabel?.text = state
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            
            guard let indexPathForCell = tableView.indexPathForSelectedRow,
            let destinationVC = segue.destination as? StateDetailTableViewController else { return }
            
            let objectToSend = States.all[indexPathForCell.row]
            
            destinationVC.state = objectToSend
        }

    }
    

}
