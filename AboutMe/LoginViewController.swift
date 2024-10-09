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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTF.text
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
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        let welcomeVC = segue.source as? WelcomeViewController
        userNameTF.text = ""
        passwordTF.text = ""
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

