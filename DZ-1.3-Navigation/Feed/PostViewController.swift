//
//  PostViewController.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 05.02.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "Anonymous"
    
    private lazy var button: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(clickButton))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = titlePost
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc private func clickButton() {
        let infoViewController = InfoViewController()
        infoViewController.modalPresentationStyle = .automatic
        present(infoViewController, animated: true)
    }
}
