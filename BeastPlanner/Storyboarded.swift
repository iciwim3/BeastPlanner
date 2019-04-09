//
//  Storyboarded.swift
//  BeastPlanner
//
//  Created by Sain-R Edwards on 4/9/19.
//  Copyright © 2019 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        
        // Full name of class
        let fullName = NSStringFromClass(self)
        
        // Gets the name of the class after the '.'
        let className = fullName.components(separatedBy: ".")[1]
        
        // The name of the storyboard that is being used
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Returns a view controller with the classname provided. Need to make sure the Storyboard ID matches the classname for this to work.
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
        
    }
    
}
