//
//  ForgotController.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

class ForgotController: BaseController<ForgotView, ForgotModel>, ForgotInputHandler {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Forgot Password"
        
        self.baseView.sendButton.addTarget(self, action: #selector(didClickSendButton), for: .touchUpInside)
        self.baseView.emailTextField.addTarget(self, action: #selector(didEndEditEmail), for: .editingDidEnd)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapBaseView))
        self.view.addGestureRecognizer(gesture)

    }
    
    // MARK: - Interaction
    
    @objc func didClickSendButton() {
        guard self.validateEmail() else {
            self.baseView.setInvalidEmailField()
            return
        }
        
        self.model.performForgot()
        
        self.showAlert(title: "To be implemented")
    }
    
    @objc func didEndEditEmail() {
        if !self.validateEmail() {
            self.baseView.setInvalidEmailField()
        } else {
            self.baseView.setValidEmailField()
        }
    }
    
    @objc func didTapBaseView() {
        self.view.endEditing(true)
    }
    
    // MARK: - Private
    
    func validateEmail() -> Bool {
        return self.baseView.emailTextField.isValidEmail()
    }
    
}
