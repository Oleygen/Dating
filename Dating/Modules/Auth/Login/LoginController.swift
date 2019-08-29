//
//  LoginController.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class LoginController: BaseController<LoginView, LoginModel>, LoginInputHandler {
    
    var onLoginTap: ((AuthResult) -> Void)?
    
    override func viewDidLoad() {
        self.shouldShowBackButton = true
        super.viewDidLoad()
        
        self.baseView.loginButton.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapBaseView))
        self.view.addGestureRecognizer(gesture)
        
    }
    
    
    @objc func didClickLoginButton() {
        self.onLoginTap?(.success)
    }
    @objc func didTapBaseView() {
        self.view.endEditing(true)
    }
}
