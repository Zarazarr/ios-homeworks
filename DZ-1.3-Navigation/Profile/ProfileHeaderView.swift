//
//  ProfileHeaderView.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 10.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let backgound: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profilePicture: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cat_with_lamp")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 50
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    
    private lazy var nameDisplay: UILabel = {
        let label = UILabel()
        label.text = "Cat With Lamp"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Показать статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapAction() {
        print(statusText.text!)
        testString = "xxxx"
        print(testString)
  //    UINavigationBar.appearance().backgroundColor = .red
  //    UITabBar.appearance().backgroundColor = .red

    }
    
    private let newUIButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Добавьте новую UIButton", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(newTapAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func newTapAction() {
        print(statusText.text!)
    }
    
    private let statusText: UILabel = {
        let label = UILabel()
        label.text = "Настало время удивительных историй"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    private let statusTextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(statusTapAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func statusTapAction() {
        statusTextField.isHidden = false
    }
    
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Что на душе?"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(statusTextFieldAction), for: .editingDidEndOnExit)
        return textField
    }()
    
    @objc private func statusTextFieldAction() {
        statusTextField.isHidden = true
        statusText.text = statusTextField.text
    }
    
    
    private let testView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 0, width: 50, height: 50))
        view.backgroundColor = .red
        view.isHidden = true
        return view
    }()
    
}
    
extension ProfileHeaderView {
        func setupView() {
            
            addSubview(backgound)
            NSLayoutConstraint.activate([
            backgound.topAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.topAnchor)!, constant: 0),
            backgound.leftAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.leftAnchor)!, constant: 0),
            backgound.rightAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.rightAnchor)!, constant: 0),
            backgound.bottomAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.bottomAnchor)!, constant: 0)])
        
            
            addSubview(profilePicture)
            NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.topAnchor)!, constant: 16),
            profilePicture.leftAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.leftAnchor)!, constant: 16),
            profilePicture.widthAnchor.constraint(equalToConstant: 100),
            profilePicture.heightAnchor.constraint(equalToConstant: 100)])
            
            addSubview(nameDisplay)
            NSLayoutConstraint.activate([
            nameDisplay.topAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.topAnchor)!, constant: 27),
            nameDisplay.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16)])
           
            addSubview(statusButton)
            NSLayoutConstraint.activate([
            statusButton.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 16),
            statusButton.leftAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.leftAnchor)!, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.rightAnchor)!, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50)])
            
            addSubview(statusText)
            NSLayoutConstraint.activate([
            statusText.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),
            statusText.rightAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.rightAnchor)!, constant: -16),
            statusText.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34)])
            
            addSubview(statusTextButton)
            NSLayoutConstraint.activate([
            statusTextButton.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),
            statusTextButton.rightAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.rightAnchor)!, constant: -16),
            statusTextButton.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34)])

            
            addSubview(statusTextField)
            NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: statusText.topAnchor, constant: 16),
            statusTextField.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),
            statusTextField.rightAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.rightAnchor)!, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 30)])
            
            addSubview(newUIButton)
            NSLayoutConstraint.activate([
            newUIButton.bottomAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.bottomAnchor)!, constant: 0),
            newUIButton.leftAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.leftAnchor)!, constant: 0),
            newUIButton.rightAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.rightAnchor)!, constant: 0),
            newUIButton.heightAnchor.constraint(equalToConstant: 50)])
            
            addSubview(testView)
        }
}

extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
