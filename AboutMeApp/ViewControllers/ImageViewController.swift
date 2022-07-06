//
//  ImageViewController.swift
//  AboutMeApp
//
//  Created by Boris Alexandrov on 05.07.2022.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageV: UIImageView! {
        didSet {
            imageV.layer.cornerRadius = 30
        }
    }
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageV.image = UIImage(named: user.person.image)
    }
}
