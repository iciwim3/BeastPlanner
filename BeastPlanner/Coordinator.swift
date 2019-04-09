//
//  Coordinator.swift
//  BeastPlanner
//
//  Created by Sain-R Edwards on 4/9/19.
//  Copyright © 2019 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
