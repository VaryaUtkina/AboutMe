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
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        userNameTF.text = user.userName
        passwordTF.text = user.password
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        let welcomeVC = tabBarVC.viewControllers?.first as? WelcomeViewController
        welcomeVC?.userName = user.person.fullname
        let navigationVC = tabBarVC.viewControllers?.last as? UINavigationController
        let personVC = navigationVC?.topViewController as? PersonViewController
        personVC?.user = user
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTF.text == user.userName, passwordTF.text == user.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password") {
                    self.passwordTF.text = ""
                }
            return false
        }
        return true
    }
    
    @IBAction func forgotNameAction() {
        showAlert(title: "Ooops", message: "User name is \(user.userName)😉")
    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(title: "Ooops", message: "Password is \(user.password)😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

