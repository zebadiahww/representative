//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Zebadiah Watson on 10/2/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var representatives: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.loadViewIfNeeded()
                self.tableView.reloadData()
            }
        }
    }
    var state: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let state = state else { return }
        RepresentativeController.searchRepresentative(forState: state) { (representatives) in
            self.representatives = representatives
        }
        
        
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? StateDetailTableViewCell else {return UITableViewCell() }
        
        
        let representative = representatives[indexPath.row]
        cell.representative = representative
        
        return cell
        
        
        
    }
}
