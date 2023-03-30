//
//  TabBarController.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 23.02.2023.
//

import UIKit


class TabBarController: UITabBarController {
        
    private lazy var feedVC : UINavigationController = {
        let vc = FeedViewController()
        vc.tabBarItem.title = "Лента"
        vc.tabBarItem.image = UIImage(systemName: "doc.richtext")
        vc.callBackTabBarControllerFeed = self.showLogIn
        return UINavigationController(rootViewController: vc)
    }()
    
    private lazy var profileVC : UINavigationController = {
        let vc = ProfileViewController()
        vc.tabBarItem.title = "Profile"
        vc.tabBarItem.image = UIImage(systemName: "person.circle")
        return UINavigationController(rootViewController: vc)
    }()
    
    private lazy var loginVC : UINavigationController = {
        let vc = LogInViewController()
        vc.tabBarItem.title = "LogIn"
        vc.tabBarItem.image = UIImage(systemName: "person.circle")
        vc.callBackTabBarControllerLogIn = self.showProfile
        return UINavigationController(rootViewController: vc)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        self.tabBar.backgroundColor = .systemBackground
        viewControllers = [loginVC, feedVC]
    }
    
    func showLogIn() {
        viewControllers = [loginVC, feedVC]
        self.selectedIndex = 0
    }
    
    func showProfile() {
        viewControllers = [profileVC, feedVC]
    }
}
