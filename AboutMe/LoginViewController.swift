//
//  ViewController.swift
//  AboutMe
//
//  Created by Варвара Уткина on 09.10.2024.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonAction() {
        guard userNameTF.text == "UserName" else { return showAlert(.wrongData) }
        guard passwordTF.text == "Password" else { return showAlert(.wrongData) }
    }
    
    @IBAction func forgotNameAction() {
        showAlert(.name)
    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(.password)
    }
    
    private func showAlert(_ alertOption: Alert) {
        let alert = switch alertOption {
        case .password:
            UIAlertController(
                title: "Ooops",
                message: "Password is password😉",
                preferredStyle: .alert
            )
        case .name:
            UIAlertController(
                title: "Ooops",
                message: "User name is UserName😉",
                preferredStyle: .alert
            )
        case .wrongData:
            UIAlertController(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                preferredStyle: .alert
            )
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if alertOption == .wrongData {
                self.userNameTF.text = ""
                self.passwordTF.text = ""
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController {
    enum Alert {
        case password
        case name
        case wrongData
    }
}

