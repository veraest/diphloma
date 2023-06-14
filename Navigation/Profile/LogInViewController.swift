//
//  LogInViewController.swift
//  Navigation
//
//  Created by Admin on 01.05.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private let notificationCenter = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let vkImageView: UIImageView = {
        let vkImageView = UIImageView()
        vkImageView.translatesAutoresizingMaskIntoConstraints = false
        vkImageView.image = UIImage(named: "logo")
        return vkImageView
    }()
    
    private lazy var vkLoginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = " Email or phone number"
        textField.backgroundColor = .systemGray6
        textField.tintColor = UIColor(named: "CustomBlue Color")
        textField.autocapitalizationType = .none
        textField.heightAnchor.constraint(equalToConstant: 49.5).isActive = true

        textField.delegate = self
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = " Password"
        textField.backgroundColor = .systemGray6
        textField.tintColor = UIColor(named: "CustomBlue Color")
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.heightAnchor.constraint(equalToConstant: 49.5).isActive = true
        textField.delegate = self
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .systemGray6
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        return stackView
    }()

    private lazy var vkButtonLogIn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true

        let normalState = UIColor.white
        let selectedState = UIColor.white.withAlphaComponent(0.8)
        let highlightedState = UIColor.white.withAlphaComponent(0.8)
        let disabledState = UIColor.white.withAlphaComponent(0.8)

        button.setTitleColor(normalState, for: .normal)
        button.setTitleColor(selectedState, for: .selected)
        button.setTitleColor(highlightedState, for: .highlighted)
        button.setTitleColor(disabledState, for: .disabled)

        button.addTarget(self, action: #selector(openProfileViewController), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var warningLabel: UILabel = {
        let warningLabel = UILabel()
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.isHidden = true
        warningLabel.minimumScaleFactor = 0.5
        warningLabel.text = "Password should be at least 6 characters long"
        warningLabel.textColor = .red
        warningLabel.font = UIFont.systemFont(ofSize: 12)
        warningLabel.textAlignment = .center
        return warningLabel
    }()
    
    private let sender = 6
    private let login = "admin"
    private let password = "password"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true

        setupViews()
        setupAutoLayout()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShows), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHides), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        view.addSubview(warningLabel)
        scrollView.addSubview(contentView)
        contentView.addSubview(vkImageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(vkLoginTextField)
        stackView.addArrangedSubview(separatorView)
        stackView.addArrangedSubview(passwordTextField)
        contentView.addSubview(vkButtonLogIn)
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            vkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkImageView.widthAnchor.constraint(equalToConstant: 100),
            vkImageView.heightAnchor.constraint(equalToConstant: 100),
            vkImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),


            stackView.topAnchor.constraint(equalTo: vkImageView.bottomAnchor, constant: 120),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.heightAnchor.constraint(equalToConstant: 100),


            vkLoginTextField.topAnchor.constraint(equalTo: stackView.topAnchor),
            vkLoginTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            vkLoginTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),

            separatorView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            separatorView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            separatorView.topAnchor.constraint(equalTo: vkLoginTextField.bottomAnchor),

            passwordTextField.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),

            vkButtonLogIn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            vkButtonLogIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            vkButtonLogIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            vkButtonLogIn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            vkButtonLogIn.heightAnchor.constraint(equalToConstant: 50),
            
            warningLabel.topAnchor.constraint(equalTo: vkButtonLogIn.bottomAnchor, constant: 10),
            warningLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            warningLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    @objc private func openProfileViewController() {
        
        if vkLoginTextField.text?.isEmpty == true {
            vkLoginTextField.backgroundColor = .red
            return
        }
        
        if  passwordTextField.text?.isEmpty == true {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderWidth = 2.0
            return
        }
        
        if let password = passwordTextField.text, password.count < sender {
            warningLabel.isHidden = false
            return
        }
        
        if vkLoginTextField.text != login || passwordTextField.text != password {
            let alert = UIAlertController(title: "Incorrect data", message: "You login or password is incorrect", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        present(alert, animated: true, completion: nil)
            return
                
        
        } else {
            let profileViewController = ProfileViewController()
            navigationController?.pushViewController(profileViewController, animated: true)
        }
        
    }
            
    @objc private func keyboardShows(notification: NSNotification) {
           if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
               scrollView.contentInset.bottom = keyboardSize.height + vkButtonLogIn.frame.height + 16
               scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + vkButtonLogIn.frame.height + 16, right: 0)
           }
    }
       
    @objc private func keyboardHides() {
           scrollView.contentInset.bottom = .zero
           scrollView.verticalScrollIndicatorInsets = .zero
    }
    
}

