//
//  WelcomeViewController.swift
//  AboutMe
//
//  Created by Варвара Уткина on 09.10.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Hello, \(userName ?? "")!"
    }
}
