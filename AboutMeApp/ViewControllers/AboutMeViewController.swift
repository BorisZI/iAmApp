//
//  AboutMeViewController.swift
//  AboutMeApp
//
//  Created by Boris Alexandrov on 05.07.2022.
//

import UIKit

class AboutMeViewController: UIViewController {

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.user = user
    }
}
    
