//
//  LogInViewController.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 21.02.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private let logoImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "logo")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail or Phone"
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        textField.tintColor = .dzCustomColor1
        textField.autocapitalizationType = .none
        textField.isHidden = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 10)
        textField.addTarget(self, action: #selector(loginTextFieldAction), for: .editingDidEnd)
        return textField
    }()
    
    @objc private func loginTextFieldAction() {
        print(loginTextField.text as Any)
    }
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        textField.tintColor = .dzCustomColor1
        textField.autocapitalizationType = .none
        textField.isHidden = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.indent(size: 10)
        textField.addTarget(self, action: #selector(passwordTextFieldAction), for: .editingDidEnd)
        return textField
    }()
    
    @objc private func passwordTextFieldAction() {
        print(passwordTextField.text as Any)
    }
    
    func checkLoginButtonStates() {
            switch logInButton.state {
            case .normal: logInButton.alpha = 1
            case .selected: logInButton.alpha = 0.8
            case .highlighted: logInButton.alpha = 0.8
            case .disabled: logInButton.alpha = 0.8
            default:
            break
            }
        }
    
    private lazy var logInButton: UIButton = {
        
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        button.layer.masksToBounds = true
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
        }()
    
    @objc private func buttonAction() {
        isLoggedIn = true
        navigationController?.setViewControllers([ProfileViewController()], animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keybordSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(logInButton)
        checkLoginButtonStates()
        
        if isLoggedIn == true {
            view.backgroundColor = .green
        }
        
        NSLayoutConstraint.activate([
    
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
        logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
        logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        logoImageView.heightAnchor.constraint(equalToConstant: 100),
        logoImageView.widthAnchor.constraint(equalToConstant: 100),
        
        loginTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
        loginTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        loginTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        loginTextField.heightAnchor.constraint(equalToConstant: 50),
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
        passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        
        logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
        logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        logInButton.heightAnchor.constraint(equalToConstant: 50),
        logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
