//
//  ProfileHeaderView.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 10.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
        
    private lazy var whiteView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0.7
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeImage)))
        return view
    }()
    
    @objc private func closeImage() {
        whiteView.removeFromSuperview()
        closeButton.removeFromSuperview()
        animatingImageView.removeFromSuperview()
    }
    
    private lazy var animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeImage)))
        return imageView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func imageAnimation() {
        addSubview(whiteView)
        addSubview(animatingImageView)
        addSubview(closeButton)

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor),
            closeButton.rightAnchor.constraint(equalTo: rightAnchor),
            ])
        
        closeButton.alpha = 0
        animatingImageView.image = profilePicture.image
        animatingImageView.frame = profilePicture.frame
        
        UIView.animate(withDuration: 0.5) {
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.animatingImageView.center.x = self.superview!.center.x
            self.animatingImageView.center.y = self.superview!.center.y - TabBarController().tabBar.bounds.height
            self.animatingImageView.layer.cornerRadius = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
            }
        }
    }
    
    @objc func closeAction() {
        UIView.animate(withDuration: 0.3) {
            self.closeButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.animatingImageView.layer.cornerRadius = self.profilePicture.layer.cornerRadius
                self.animatingImageView.frame = self.profilePicture.frame
            } completion: { _ in
                self.whiteView.removeFromSuperview()
                self.closeButton.removeFromSuperview()
                self.animatingImageView.removeFromSuperview()
            }
        }
    }
    
    private let backgound: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var profilePicture: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cat_with_lamp")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 50
        image.layer.borderColor = UIColor.white.cgColor
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageAnimation)))
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
    
    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Установить статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(setStatusAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Что на душе?"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.isHidden = false
        textField.indent(size: 10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(setStatusAction), for: .editingDidEndOnExit)
        return textField
    }()
    
    @objc private func setStatusAction() {
        if statusTextField.text == "" {
            statusTextField.shakeAnimation()
        } else {
            statusText.text = statusTextField.text
            statusTextField.text = nil
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(backgound)
        addSubview(profilePicture)
        addSubview(nameDisplay)
        addSubview(statusButton)
        addSubview(statusText)
        addSubview(statusTextField)
        
        NSLayoutConstraint.activate([
            backgound.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgound.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            backgound.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            backgound.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            profilePicture.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profilePicture.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            profilePicture.widthAnchor.constraint(equalToConstant: 100),
            profilePicture.heightAnchor.constraint(equalToConstant: 100),
            
            nameDisplay.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameDisplay.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),

            statusText.topAnchor.constraint(equalTo: nameDisplay.bottomAnchor, constant: 16),
            statusText.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),
            statusText.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

            statusTextField.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),
            statusTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 30),
            
            statusButton.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 16),
            statusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}

