//
//  InfoViewController.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 06.02.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Назад", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupButton()
    }
    
    private func setupButton() {
        view.addSubview(backButton)
        backButton.center = view.center
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    @objc private func backAction() {
        
        let alert = UIAlertController(title: "Перейти назад", message: "Вы точно хотите выйти?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Выйти", style: .default) { _ in
            self.dismiss(animated: true)
            print("OK")
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive) { _ in
            print("Cancel")
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
