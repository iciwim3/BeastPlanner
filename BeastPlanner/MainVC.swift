//
//  MainVC.swift
//  BeastPlanner
//
//  Created by Sain-R Edwards on 4/9/19.
//  Copyright © 2019 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit

class MainVC: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    let titles = ["What's Dope", "What Needs Work", "Speak It Into Existence", "Daily Tasks", "Ideas"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// Delegate Methods - What happens when the user interacts with the tableview
extension MainVC: UITableViewDelegate {
    
    func configureText(for cell: UITableViewCell, with title: String) {
        if let label = cell.viewWithTag(100) as? UILabel {
            label.text = title
        }
    }
}

// Datasource Methods - What the tableview will display
extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let title = titles[indexPath.row]
        configureText(for: cell, with: title)
        return cell
    }
    
}

