//
//  LoginController.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import UIKit

final class LoginController: BaseController<LoginView, LoginModel>, LoginInputHandler {
    //controller handler
    var onCompleteAuth: (() -> Void)?
    var onSignUpButtonTap: (() -> Void)?
    var onForgotButtonTap: (() -> Void)?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        
        self.baseView.okButton.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)
        self.baseView.registerButton.addTarget(self, action: #selector(didClickRegisterButton), for: .touchUpInside)
        self.baseView.forgotButton.addTarget(self, action: #selector(didClickForgotButton), for: .touchUpInside)
        self.baseView.emailTextField.addTarget(self, action: #selector(didEndEditEmail), for: .editingDidEnd)
        self.baseView.passwordTextField.addTarget(self, action: #selector(didEndEditPassword), for: .editingDidEnd)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapBaseView))
        self.view.addGestureRecognizer(gesture)
        
//        BiometricAuthenticator.showDialog(with: BiometricAuthenticatorConfig.login, successHandler: { [weak self] (email, password) in
//            self?.baseView.emailTextField.text = email
//            self?.baseView.passwordTextField.text = password
//            
//            self?.didClickLoginButton()
//        })
    }
    
    // MARK: - Interaction
    
    @objc func didClickLoginButton() {
//        guard self.validateEmail() else {
//            self.baseView.setInvalidEmailField()
//            return
//        }
//        
//        guard self.validatePassword() else {
//            self.baseView.setInvalidPasswordField()
//            return
//        }
//        self.model.login(email: self.baseView.emailTextField.text!, password: self.baseView.passwordTextField.text!, successHandler: { [weak self] in
//            if let onCompleteAuth = self?.onCompleteAuth {
//                onCompleteAuth()
//            }
//        }) { error in
//            self.showAlert(title: error.localizedDescription)
//        }
    }
    
    @objc func didClickRegisterButton() {
        if let onSignUpButtonTap = onSignUpButtonTap {
            onSignUpButtonTap()
        }
    }
    
    @objc func didClickForgotButton() {
        if let onForgotButtonTap = onForgotButtonTap {
            onForgotButtonTap()
        }
    }
    
    @objc func didEndEditEmail() {
        if !self.validateEmail() {
            self.baseView.setInvalidEmailField()
        } else {
            self.baseView.setValidEmailField()
        }
    }
    
    @objc func didEndEditPassword() {
        if !self.validatePassword() {
            self.baseView.setInvalidPasswordField()
        } else {
            self.baseView.setValidPasswordlField()
        }
    }
    
    @objc func didTapBaseView() {
        self.view.endEditing(true)
    }
    
    // MARK: - Private
    
    func validateEmail() -> Bool {
        return self.baseView.emailTextField.isValidEmail()
    }
    
    func validatePassword() -> Bool {
        return self.baseView.passwordTextField.isValidPassword()
    }
    
    deinit {
        print("deinit \(#file)")
    }
}
