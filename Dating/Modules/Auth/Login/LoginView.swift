//
//  LoginView.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class LoginView: FullScreenView {

    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var okButton: UIButton!
    var registerButton: UIButton!
    var forgotButton: UIButton!
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        emailTextField = UITextField(frame: .zero)
        emailTextField.font = titleTextFont
        emailTextField.placeholder = "Enter your email"
        emailTextField.textContentType = UITextContentType.emailAddress
        emailTextField.autocapitalizationType = .none
        self.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { maker in
            maker.topMargin.equalToSuperview().offset(20)
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
        
        okButton = UIButton(frame: .zero)
        okButton.setTitle("Log In", for: .normal)
        okButton.setTitleColor(self.tintColor, for: .normal)
        self.addSubview(okButton)
        okButton.snp.makeConstraints { maker in
            maker.topMargin.equalTo(passwordTextField.snp.bottom).offset(20)
            maker.width.equalTo(150)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
        }
        
        registerButton = UIButton(frame: .zero)
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(self.tintColor, for: .normal)
        self.addSubview(registerButton)
        registerButton.snp.makeConstraints { maker in
            maker.topMargin.equalTo(okButton.snp.bottom).offset(20)
            maker.width.equalTo(150)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
        }
        
        forgotButton = UIButton(frame: .zero)
        forgotButton.setTitle("Forgot Password", for: .normal)
        forgotButton.setTitleColor(self.tintColor, for: .normal)
        self.addSubview(forgotButton)
        forgotButton.snp.makeConstraints { maker in
            maker.topMargin.equalTo(registerButton.snp.bottom).offset(20)
            maker.width.equalTo(150)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func setValidPasswordlField() {
        self.passwordTextField.backgroundColor = validBackgroundColor
    }
    
    
    deinit {
        print("deinit \(#file)")
    }
    
}
