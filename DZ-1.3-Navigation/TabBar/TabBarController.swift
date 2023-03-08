//
//  TabBarController.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 23.02.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    var feedVC = UINavigationController(rootViewController: FeedViewController())
    private let profileVC = UINavigationController(rootViewController: ProfileViewController())
    private let loginVC = UINavigationController(rootViewController: LogInViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        self.tabBar.backgroundColor = .systemBackground
        viewControllers = [loginVC, feedVC]
        loginVC.tabBarItem.title = "Профиль"
        loginVC.tabBarItem.image = UIImage(systemName: "person.circle")
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.circle")
        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "doc.richtext")
        //      UINavigationBar.appearance().backgroundColor = .systemBackground
        //      UINavigationBar.appearance().isHidden = true
    }
    
}
