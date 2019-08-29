//
//  LoginView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class LoginView: FullScreenView {
    var loginTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        self.loginTextField = UITextField(frame: .zero)
        loginTextField.placeholder = "email"
        
        self.passwordTextField = UITextField(frame: .zero)
        passwordTextField.placeholder = "password"
        
        self.loginButton = UIButton(frame: .zero)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        loginButton.titleLabel?.textAlignment = .center
        
        self.addSubview(loginTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        
        loginTextField.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(80)
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
            maker.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(loginTextField.snp.bottom).offset(20)
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
            maker.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { (maker) in
            maker.bottom.equalToSuperview().offset(-20)
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
            maker.height.equalTo(50)
        }
        
        loginTextField.layer.cornerRadius = 8
        loginTextField.layer.borderColor = UIColor.black.cgColor
        loginTextField.layer.borderWidth = 2
        
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 2
        
        loginButton.layer.cornerRadius = 8
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
