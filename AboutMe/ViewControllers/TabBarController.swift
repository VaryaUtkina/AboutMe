//
//  TabBarViewController.swift
//  AboutMe
//
//  Created by Варвара Уткина on 10.10.2024.
//

import UIKit

final class TabBarController: UITabBarController {

    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        tabBar.items?.last?.title = user.person.fullname
        
        transferData()
    }

    private func transferData() {
        guard let viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let personVC = navigationVC.topViewController
                guard let personVC = personVC as? PersonViewController else { return }
                personVC.user = user
            }
        }
    }
}
