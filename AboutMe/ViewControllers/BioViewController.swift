//
//  BioViewController.swift
//  AboutMe
//
//  Created by Варвара Уткина on 10.10.2024.
//

import UIKit

final class BioViewController: UIViewController {

    @IBOutlet var bioLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        bioLabel.text = user.person.bio
        navigationItem.title = user.person.fullname
    }
    

}
