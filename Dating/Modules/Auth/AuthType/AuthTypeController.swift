//
//  AuthTypeController.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

class AuthTypeController: BaseController<AuthTypeView, AuthTypeModel>, AuthTypeInputHandler {
    var onPickAuthType: ((AuthType) -> Void)?
    
    override func viewDidLoad() {
        self.shouldShowBackButton = false
        super.viewDidLoad()
        
        self.baseView.loginButton.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)
        self.baseView.registerButton.addTarget(self, action: #selector(didClickRegisterButton), for: .touchUpInside)
    }
    
    @objc func didClickLoginButton() {
        self.onPickAuthType?(.login)
    }
    
    @objc func didClickRegisterButton() {
        self.onPickAuthType?(.register)
    }
}
