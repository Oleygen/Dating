//
//  RegisterView.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

class RegisterView: FullScreenView {
    
    var firstNameTextField: UITextField!
    var lastNameTextField: UITextField!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var phoneTextField: UITextField!
    var signUpButton: UIButton!
    
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        firstNameTextField = UITextField(frame: .zero)
        firstNameTextField.font = titleTextFont
        firstNameTextField.placeholder = "Enter your first name"
        firstNameTextField.textContentType = UITextContentType.name
        self.addSubview(firstNameTextField)
        firstNameTextField.snp.makeConstraints { maker in
            maker.topMargin.equalToSuperview().offset(20)
            maker.width.equalTo(250)
            maker.centerX.equalToSuperview()
        }
        
        lastNameTextField = UITextField(frame: .zero)
        lastNameTextField.font = titleTextFont
        lastNameTextField.placeholder = "Enter your last name"
        lastNameTextField.textContentType = UITextContentType.name
        self.addSubview(lastNameTextField)
        lastNameTextField.snp.makeConstraints { maker in
            maker.topMargin.equalTo(firstNameTextField.snp.bottom).offset(20)
            maker.width.equalTo(250)
            maker.centerX.equalToSuperview()
        }
        
        emailTextField = UITextField(frame: .zero)
        emailTextField.font = titleTextFont
        emailTextField.placeholder = "Enter your email"
        emailTextField.textContentType = UITextContentType.emailAddress
        emailTextField.autocapitalizationType = .none
        self.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { maker in
            maker.topMargin.equalTo(lastNameTextField.snp.bottom).offset(20)
            maker.width.equalTo(250)
            maker.centerX.equalToSuperview()
        }
        
        passwordTextField = UITextField(frame: .zero)
        passwordTextField.font = titleTextFont
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.textContentType = UITextContentType.password
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        self.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { maker in
            maker.topMargin.equalTo(emailTextField.snp.bottom).offset(20)
            maker.width.equalTo(250)
            maker.centerX.equalToSuperview()
        }
        
        phoneTextField = UITextField(frame: .zero)
        phoneTextField.font = titleTextFont
        phoneTextField.placeholder = "Enter your phone number"
        phoneTextField.textContentType = UITextContentType.telephoneNumber
        self.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { maker in
            maker.topMargin.equalTo(passwordTextField.snp.bottom).offset(20)
            maker.width.equalTo(250)
            maker.centerX.equalToSuperview()
        }
        
        signUpButton = UIButton(frame: .zero)
        signUpButton.setTitle("Register", for: .normal)
        signUpButton.setTitleColor(self.tintColor, for: .normal)
        self.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { maker in
            maker.topMargin.equalTo(phoneTextField.snp.bottom).offset(20)
            maker.width.equalTo(150)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setInvalidFirstNameField() {
        self.firstNameTextField.backgroundColor = invalidBackgroundColor
    }
    
    func setValidFirstNameField() {
        self.firstNameTextField.backgroundColor = validBackgroundColor
    }
    
    func setInvalidLastNameField() {
        self.lastNameTextField.backgroundColor = invalidBackgroundColor
    }
    
    func setValidLastNameField() {
        self.lastNameTextField.backgroundColor = validBackgroundColor
    }
    
    func setInvalidEmailField() {
        self.emailTextField.backgroundColor = invalidBackgroundColor
    }
    
    func setValidEmailField() {
        self.emailTextField.backgroundColor = validBackgroundColor
    }
    
    func setInvalidPasswordField() {
        self.passwordTextField.backgroundColor = invalidBackgroundColor
    }
    
    func setValidPasswordField() {
        self.passwordTextField.backgroundColor = validBackgroundColor

    }
    
    func setInvalidPhoneField() {
        self.phoneTextField.backgroundColor = invalidBackgroundColor
    }
    
    func setValidPhoneField() {
        self.phoneTextField.backgroundColor = validBackgroundColor

    }
    
    
}
