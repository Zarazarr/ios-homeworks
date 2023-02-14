//
//  FeedViewController.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 05.02.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")
    
    private lazy var button: UIButton = {
            let button = UIButton()
            button.backgroundColor = .blue
            button.layer.cornerRadius = 5
            button.setTitle("Открыть пост", for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 28) //.boldSystemFont(ofSize: 20)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        setupButton()
    }
    
    private func setupButton() {
            self.view.addSubview(self.button)
            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
            self.button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
    
    
    @objc private func buttonAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
        }
}
