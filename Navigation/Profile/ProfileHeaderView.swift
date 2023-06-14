//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Admin on 18.04.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {

    //MARK: - Properties
    
     var statusText = ""

    
    
    private lazy var avatarImageView: UIImageView = {
                
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.backgroundColor = .lightGray
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.image = UIImage(named: "space cat")
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.clipsToBounds = true
        avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOnAvatar)))
        avatarImageView.isUserInteractionEnabled = true
        return avatarImageView
    }()
    
    private let avatarLabel: UILabel = {
        let avatarLabel = UILabel()
        avatarLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarLabel.text = "Austro Cat"
        avatarLabel.adjustsFontSizeToFitWidth = true
        avatarLabel.minimumScaleFactor = 0.5
        avatarLabel.font = UIFont.boldSystemFont(ofSize: 18)
        avatarLabel.textColor = .black
        return avatarLabel
    }()
        
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "In the dark of Universe"
        label.textColor = .gray
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
        
    private lazy var statusField: UITextField = {
        let statusField = UITextField()
        statusField.backgroundColor = .white
        statusField.layer.cornerRadius = 15
        statusField.placeholder = "Enter your status"
        statusField.textAlignment = .center
        statusField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusField.layer.borderWidth = 1
        statusField.layer.borderColor = UIColor.black.cgColor
        statusField.translatesAutoresizingMaskIntoConstraints = false
        statusField.addTarget(self, action: #selector(enterYourStatus), for: .editingChanged)
        statusField.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        return statusField
    }()
        
    private lazy var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    
    private let halfTrasparentView: UIView =  {
        let view = UIView()
            view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            view.alpha = 0
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
    }()
    
    
       
    private lazy var crossButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.tintColor = .black
        button.alpha = 0
        button.addTarget(self, action: #selector(closingButton), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
   
    
        
    //MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupAutoLayout()
        
        
    }
    
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private func
        
    private func setupViews() {
              
        
        addSubview(avatarLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
        addSubview(statusField)
        addSubview(crossButton)
        addSubview(halfTrasparentView)
        addSubview(avatarImageView)
        halfTrasparentView.addSubview(crossButton)
        
    }
        
    private func setupAutoLayout() {
        
               
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            
            avatarLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            avatarLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -60),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25),
            
            statusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 11),
            statusField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 21),
            statusField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            statusField.heightAnchor.constraint(equalToConstant: 40),
            
            crossButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            crossButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            crossButton.widthAnchor.constraint(equalToConstant: 30),
            crossButton.heightAnchor.constraint(equalToConstant: 30),
            
            halfTrasparentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            halfTrasparentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            halfTrasparentView.topAnchor.constraint(equalTo: topAnchor),
            halfTrasparentView.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
    }
    
    @objc private func buttonPressed() {
        
        if statusField.text?.isEmpty == true {
            shakeTextField(to: statusField)
            
        } else {
            statusLabel.text = statusText
            statusField.text = ""
            print("Status Text: \(statusText)")
        }
    }
    
    private func shakeTextField(to textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.repeatCount = 3
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
                animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
                textField.layer.add(animation, forKey: "position")
        animation.duration = 0.08
        animation.autoreverses = true
    }
        
    @objc private func enterYourStatus(_ textField: UITextField) {

            statusText = textField.text ?? ""
              
    }
        
    @objc private func hideKeyboard() {
        endEditing(true)
    }
    
    @objc private func tapOnAvatar() {
        UIView.animate(withDuration: 1.0, animations: {
            self.avatarImageView.transform = CGAffineTransform(scaleX: 4.2, y: 3.5)
            self.halfTrasparentView.frame = .init(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 420, height: 850))
            self.avatarImageView.center = self.halfTrasparentView.center
            self.avatarImageView.layer.cornerRadius = 0
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.crossButton.alpha = 1
                self.halfTrasparentView.alpha = 1
            }
        }
        
    }
    
    @objc private func closingButton(){
        print("Done")
        
        UIView.animate(withDuration: 0.3, animations: {
            self.crossButton.alpha = 0
            self.halfTrasparentView.alpha = 0
        
       }) { _ in
               UIView.animate(withDuration: 0.5, animations: {
                   self.avatarImageView.frame = .init(origin: CGPoint(x: 16, y: 16), size: CGSize(width: 100, height: 100))
                   self.avatarImageView.transform = .identity
                   self.avatarImageView.layer.cornerRadius = 50
        
    
           })
        }
    }

}
    


    

