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
        createNavigationTitleWithImage()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 140
    }

}

// Delegate Methods - What happens when the user interacts with the tableview
extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            coordinator?.noteList()
            cell.textLabel?.text = navigationItem.title
        }
    }
    
    func configureText(for cell: UITableViewCell, with title: String) {
        if let label = cell.viewWithTag(100) as? UILabel {
            label.text = title
        }
    }
}

// Datasource Methods - What the tableview will display
extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let title = titles[indexPath.row]
        configureText(for: cell, with: title)
        return cell
    }
    
    func createNavigationTitleWithImage() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "bmp.png")
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    func getNotes(for cell: UITableViewCell, with title: String) {
        
    }
    
}

