//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Boris Zitserman on 05.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    var user: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.person.fullName)"
    }
}
