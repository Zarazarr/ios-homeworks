//
//  TestView.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 10.03.2023.
//

// MARK: Tests, Tests, Test

import UIKit

class TestView: UIView {
        
    private let test = "test"
        
    var whiteView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0.7
        return view
    }()
    
    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
   //     button.backgroundColor = .green
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()
    
    private let testView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 0, width: 50, height: 50))
        view.backgroundColor = .red
        view.isHidden = true
        return view
    }()
 
    private let backgound: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
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
        
    @objc func shakeProfilePicture() {
        print("avatar tap")
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: profilePicture.center.x - 5, y: profilePicture.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: profilePicture.center.x + 5, y: profilePicture.center.y))
        profilePicture.layer.add(animation, forKey: "position")
    }
    
    @objc private func imageAnimation() {
        addSubview(whiteView)
        addSubview(animatingImageView)
        addSubview(closeButton)

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            closeButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0),
            ])
        
        closeButton.alpha = 0
        animatingImageView.image = profilePicture.image
        animatingImageView.frame = profilePicture.frame
        
        UIView.animate(withDuration: 0.5) {
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                   height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.center
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
        
    private lazy var nameDisplay: UILabel = {
        let label = UILabel()
        label.text = "Cat With Lamp"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var statusButton: UIButton = {
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
    }
    
    private lazy var newUIButton: UIButton = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
                
        addSubview(backgound)
        addSubview(profilePicture)
        addSubview(nameDisplay)
        addSubview(statusButton)
        addSubview(statusText)
        addSubview(newUIButton)
   //     addSubview(testView)
        
        NSLayoutConstraint.activate([
        
            backgound.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            backgound.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 0),
            backgound.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0),
            backgound.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
        
            profilePicture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            profilePicture.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            profilePicture.widthAnchor.constraint(equalToConstant: 100),
            profilePicture.heightAnchor.constraint(equalToConstant: 100),
        
            nameDisplay.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nameDisplay.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),
        
            statusButton.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 16),
            statusButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
        
            statusText.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),
            statusText.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            statusText.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
    
            newUIButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            newUIButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 0),
            newUIButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0),
            newUIButton.heightAnchor.constraint(equalToConstant: 50)])
    }
}

extension TestView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}

