//
//  TestVC.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 10.03.2023.
//

// MARK: Tests, Tests, Test

import UIKit

class TestVC: UIViewController {
    
    let profileHeaderView = TestView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Профиль"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.bounds
        view.addSubview(profileHeaderView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

