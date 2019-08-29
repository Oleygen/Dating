//
//  UnloggedController.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class UnloggedController: BaseController<UnloggedView, UnloggedModel>, UnloggedInputHandler {
    var onLoginTap: (() -> Void)?
    
    override func viewDidLoad() {
         self.shouldShowBackButton = false
        self.shouldShowMenuButton = true

        super.viewDidLoad()
        self.baseView.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
    }
    
    @objc func didTapLogin() {
        if SessionService.authorized {
            self.showAlert(title: "Already authorized")
            return
        }
        if let onLoginTap = onLoginTap {
            onLoginTap()
        }
    }
}
