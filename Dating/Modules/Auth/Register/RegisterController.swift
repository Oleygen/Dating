//
//  RegisterController.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import UIKit

final class RegisterController: BaseController<RegisterView, RegisterModel>, RegisterInputHandler {
    
    //controller handler
    var onSignUpComplete: (() -> Void)?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SignUp"
        
        self.baseView.signUpButton.addTarget(self, action: #selector(didClickSignUpButton), for: .touchUpInside)
        self.baseView.firstNameTextField.addTarget(self, action: #selector(didEndEditFirstName), for: .editingDidEnd)
        self.baseView.lastNameTextField.addTarget(self, action: #selector(didEndEditLastName), for: .editingDidEnd)

        self.baseView.emailTextField.addTarget(self, action: #selector(didEndEditEmail), for: .editingDidEnd)
        self.baseView.passwordTextField.addTarget(self, action: #selector(didEndEditPassword), for: .editingDidEnd)
        self.baseView.phoneTextField.addTarget(self, action: #selector(didEndEditPhone), for: .editingDidEnd)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapBaseView))
        self.view.addGestureRecognizer(gesture)
    }
    
    // MARK: - Interaction
    
    @objc func didClickSignUpButton() {
//        guard self.validateFirstName() else {
//            self.baseView.setInvalidFirstNameField()
//            return
//        }
//        guard self.validateLastName() else {
//            self.baseView.setInvalidLastNameField()
//            return
//        }
//        guard self.validateEmail() else {
//            self.baseView.setInvalidEmailField()
//            return
//        }
//        
//        guard self.validatePassword() else {
//            self.baseView.setInvalidPasswordField()
//            return
//        }
//        
//        guard self.validatePhone() else {
//            self.baseView.setInvalidPhoneField()
//            return
//        }
//        
//    
//        let userVM = UserViewModel(firstName: self.baseView.firstNameTextField.text!, lastName: self.baseView.lastNameTextField.text!, password: self.baseView.passwordTextField.text!, phone: self.baseView.phoneTextField.text, email: self.baseView.emailTextField.text!)
//        
//        self.model.register(userViewModel: userVM, successHandler: { [weak self] in
//            if let onSignUpComplete = self?.onSignUpComplete {
//                onSignUpComplete()
//            }
//        }) { error in
//            self.showAlert(title: error.localizedDescription)
//        }
    }
    
    @objc func didEndEditFirstName() {
        if !self.validateFirstName() {
            self.baseView.setInvalidFirstNameField()
        } else {
            self.baseView.setValidFirstNameField()
        }
    }
    
    @objc func didEndEditLastName() {
        if !self.validateLastName() {
            self.baseView.setInvalidLastNameField()
        } else {
            self.baseView.setValidLastNameField()
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
            self.baseView.setValidPasswordField()
        }
    }
    
    @objc func didEndEditPhone() {
        if !self.validatePhone() {
            self.baseView.setInvalidPhoneField()
        } else {
            self.baseView.setValidPhoneField()
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
    
    func validateFirstName() -> Bool {
        return self.baseView.firstNameTextField.isValidName()
    }
    
    func validateLastName() -> Bool {
        return self.baseView.lastNameTextField.isValidName()
    }
    
    func validatePhone() -> Bool {
        return self.baseView.phoneTextField.isValidPhone()
    }

}
