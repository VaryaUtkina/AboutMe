//
//  PersonViewController.swift
//  AboutMe
//
//  Created by Варвара Уткина on 10.10.2024.
//

import UIKit

final class PersonViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var postLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        imageView.image = UIImage(named: user.person.photo)
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        postLabel.text = user.person.post
        navigationItem.title = user.person.fullname
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else { return }
        bioVC.user = user
    }

}
