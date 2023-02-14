//
//  ProfileViewController.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 05.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()//frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Profile"
  //    profileHeaderView.frame = self.view.frame
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.bounds
        view.addSubview(profileHeaderView)
        profileHeaderView.setupView()
    }
    
}
