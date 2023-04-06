//
//  LogInViewController.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 21.02.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    var callBackTabBarControllerLogIn: (() -> ())?
    
    private let deffaultLogin = "catwithlamp@vk.ru"
    private let deffaultPassword = "IOS-CP-3"
    
    private let notification = NotificationCenter.default
    
    private var loginButtonCounter = 0

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        contentView.isUserInteractionEnabled = true
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissInput)))
        return contentView
    }()
    
    private lazy var logoImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "logo")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backdoor)))
        $0.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(fillLoginData)))
        return $0
    }(UIImageView())
    
    @objc private func backdoor() {
        isLoggedIn = true
        loginButtonCounter += 1
        if loginButtonCounter > 4 {
            navigationController?.pushViewController(ProfileViewController(), animated: false)
            loginButtonCounter = 0
        }
    }
    @objc private func fillLoginData() {
        loginTextField.text = deffaultLogin
        passwordTextField.text = deffaultPassword
    }
    
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
        textField.isSecureTextEntry = false
        textField.clearsOnBeginEditing = false
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 10)
        textField.addTarget(self, action: #selector(loginTextFieldAction), for: .editingDidEndOnExit)
        return textField
    }()
    
    @objc private func loginTextFieldAction() {
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
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        textField.clearsOnBeginEditing = false
        textField.indent(size: 10)
        textField.addTarget(self, action: #selector(loginButtonAction), for: .editingDidEndOnExit)
        textField.addTarget(self, action: #selector(clearWarning), for: .allEditingEvents)
        return textField
    }()
    
    @objc private func passwordTextFieldAction() {
    }
    @objc private func clearWarning() {
        shortPasswordLabel.isHidden = true
    }
    
    private lazy var showPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        return button
    }()
    
    @objc private func showPassword() {
        passwordTextField.isSecureTextEntry.toggle()
        if passwordTextField.isSecureTextEntry == false {
            showPasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        } else {
            showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }
    
    private lazy var shortPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль короче 6 символов"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
    private lazy var invalidEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "Ошибка в формате Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
    private lazy var logInButton: UIButton = {
        
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        button.layer.masksToBounds = true
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func loginButtonAction() {
        if loginTextField.text == deffaultLogin && passwordTextField.text == deffaultPassword {
            self.callBackTabBarControllerLogIn?()
        } else if loginTextField.text == "" || passwordTextField.text == "" {
            checkLoginPasswordEmpty()
        } else if passwordTextField.text!.count < 6 {
            shortPasswordLabel.isHidden = false
        } else {
            let alert = UIAlertController(title: "Неправильный логин или пароль", message: "Подсказка: logoImageView.addGestureRecognizer(UILongPressGestureRecognizer", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.dismiss(animated: true)
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginTextField.text = ""
        passwordTextField.text = ""
        navigationController?.tabBarController?.tabBar.isHidden = true
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
        navigationController?.tabBarController?.tabBar.isHidden = false
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
    
    private func checkLoginPasswordEmpty() {
        if loginTextField.text == "" {
                    loginTextField.shakeAnimation()
        }
        if passwordTextField.text == "" {
            passwordTextField.shakeAnimation()
        }
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(logInButton)
        contentView.addSubview(shortPasswordLabel)
        contentView.addSubview(showPasswordButton)
        contentView.addSubview(invalidEmailLabel)
        checkLoginButtonStates()
        
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
            
            shortPasswordLabel.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor),
            shortPasswordLabel.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            
            invalidEmailLabel.rightAnchor.constraint(equalTo: loginTextField.rightAnchor),
            invalidEmailLabel.bottomAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            
            showPasswordButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor,constant: -25),
            showPasswordButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            showPasswordButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor),
            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension LogInViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        if textField ==  loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
        
    @objc func dismissInput() {
        view.endEditing(true)
    }
    
}
